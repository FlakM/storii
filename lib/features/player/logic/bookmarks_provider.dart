import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/app/repositories/me_repository.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'bookmarks_provider.g.dart';

@riverpod
Future<List<Bookmark>> bookmarks(Ref ref, String itemId) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.bookmarks.where((b) => b.libraryItemId == itemId).toList()
    ..sort((a, b) => a.time.compareTo(b.time));
}

class BookmarksController {
  const new(this.repo);

  final MeRepository repo;

  Future<bool> create({
    required String itemId,
    required Duration time,
    required String title,
  }) async {
    try {
      await repo.createBookmark(
        libraryItemId: itemId,
        time: time,
        title: title,
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> modify({
    required String itemId,
    required Duration time,
    required String title,
  }) async {
    try {
      await repo.updateBookmark(
        libraryItemId: itemId,
        time: time,
        title: title,
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> remove({required String itemId, required Duration time}) async {
    try {
      await repo.removeBookmark(libraryItemId: itemId, time: time);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}

@riverpod
BookmarksController bookmarksController(Ref ref) {
  final repo = ref.watch(meRepositoryProvider);
  return BookmarksController(repo);
}
