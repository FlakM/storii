import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'user_progress_actions.g.dart';

@Riverpod(keepAlive: true)
class UserProgressActionsNotifier extends _$UserProgressActionsNotifier {
  @override
  void build(String itemId, [String? episodeId]) {}

  Future<bool> markComplete({bool isFinished = true}) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
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
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.removeMediaProgress(mediaProgressId: progressId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeEpisodeProgress() async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
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
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.removeFromContinueListening(mediaProgressId: mediaProgressId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> removeSeriesFromContinueListening(String seriesId) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.removeSeriesFromContinueListening(seriesId: seriesId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }

  Future<bool> reAddSeriesToContinueListening(String seriesId) async {
    await ref.read(authGateProvider.future);
    final repo = ref.read(meRepositoryProvider);
    try {
      await repo.reAddSeriesToContinueListening(seriesId: seriesId);
      return true;
    } on AppError catch (_) {
      return false;
    }
  }
}
