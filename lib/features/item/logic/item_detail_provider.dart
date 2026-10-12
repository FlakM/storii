import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/storage/local/items_cache.dart';

part 'item_detail_provider.g.dart';

@Riverpod(keepAlive: true)
class ItemDetail extends _$ItemDetail {
  @override
  Future<LibraryItem> build(String id) async {
    final cache = ref.read(itemsCacheProvider.notifier);
    ref.listen(libraryItemUpdatedProvider, (_, next) {
      final updated = next.value;
      if (updated == null || updated.id != id || !state.hasValue) return;
      state = AsyncData(updated);
      unawaited(cache.put(updated));
    });

    final isConnected = ref.watch(serverConnectionProvider);
    if (!isConnected) {
      final localItem = cache.get(id);
      if (localItem != null) return localItem;
      throw l10n.connectionServerDisconnected;
    }

    await ref.read(authGateProvider.future);
    final repo = ref.read(itemRepositoryProvider);
    try {
      final remoteItem = await repo.getItem(id, includeProgress: true);
      unawaited(cache.put(remoteItem));
      return remoteItem;
    } on AppError catch (error) {
      if (error.type == .network || error.type == .timeout) {
        final localItem = cache.get(id);
        if (localItem != null) return localItem;
      }
      rethrow;
    }
  }
}

@riverpod
Stream<LibraryItem?> libraryItemUpdated(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.itemEvents.onItemUpdated;
}
