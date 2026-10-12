import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/init.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';

part 'item_actions_provider.g.dart';

@Riverpod(keepAlive: true)
class ScanItem extends _$ScanItem {
  @override
  Future<Set<String>> build() async => {};

  Future<String?> scan(String itemId) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(itemRepositoryProvider);

    try {
      state = AsyncData({...?state.value}..add(itemId));
      final result = await repo.scanItem(itemId);
      return switch (result) {
        .added => l10n.itemScanAdded,
        .updated => l10n.itemScanUpdated,
        .removed => l10n.itemScanRemoved,
        .upToDate => l10n.itemScanUpToDate,
        .nothing => l10n.itemScanNothing,
        _ => null,
      };
    } finally {
      state = AsyncData({...?state.value}..remove(itemId));
    }
  }
}
