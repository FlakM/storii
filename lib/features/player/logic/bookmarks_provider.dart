import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'bookmarks_provider.g.dart';

@riverpod
Future<List<Bookmark>> bookmarks(Ref ref, String itemId) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.bookmarks.where((b) => b.libraryItemId == itemId).toList()
    ..sort((a, b) => a.time.compareTo(b.time));
}

@Riverpod(keepAlive: true)
class BookmarksController extends _$BookmarksController {
  @override
  void build(String itemId) {}

  Future<bool> create({required Duration time, required String title}) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.createBookmark(
        libraryItemId: itemId,
        time: time,
        title: title,
      );
      ref.invalidate(serverUserProvider);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> modify({required Duration time, required String title}) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.updateBookmark(
        libraryItemId: itemId,
        time: time,
        title: title,
      );
      ref.invalidate(serverUserProvider);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> remove({required Duration time}) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.removeBookmark(libraryItemId: itemId, time: time);
      ref.invalidate(serverUserProvider);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}
