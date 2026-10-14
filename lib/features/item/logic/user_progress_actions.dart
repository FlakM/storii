import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/repositories/me_repository.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'user_progress_actions.g.dart';

class UserProgressActions {
  const new(this.repo);

  final MeRepository repo;

  Future<bool> markComplete({
    required String itemId,
    String? episodeId,
    bool isFinished = true,
  }) async {
    try {
      await repo.upsertMediaProgress(
        libraryItemId: itemId,
        episodeId: episodeId,
        params: UpsertProgressRequestParams(isFinished: isFinished),
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> remove(String progressId) async {
    try {
      await repo.removeMediaProgress(mediaProgressId: progressId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeEpisodeProgress({
    required String itemId,
    String? episodeId,
  }) async {
    try {
      await repo.upsertMediaProgress(
        libraryItemId: itemId,
        episodeId: episodeId,
        params: const UpsertProgressRequestParams(isFinished: false),
      );
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeFromContinueListening(String mediaProgressId) async {
    try {
      await repo.removeFromContinueListening(mediaProgressId: mediaProgressId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeSeriesFromContinueListening(String seriesId) async {
    try {
      await repo.removeSeriesFromContinueListening(seriesId: seriesId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> reAddSeriesToContinueListening(String seriesId) async {
    try {
      await repo.reAddSeriesToContinueListening(seriesId: seriesId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}

@riverpod
UserProgressActions userProgressActions(Ref ref) {
  final repo = ref.watch(meRepositoryProvider);
  return UserProgressActions(repo);
}
