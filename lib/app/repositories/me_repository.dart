import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class MeRepository {
  final MeApi _api;
  final Future<void> auth;
  const new(this._api, {required this.auth});

  static const _source = 'MeRepository';

  Future<T> _call<T>(Future<T> Function() call, {String? logMessage}) =>
      callWithAuth(auth, call, source: _source, logMessage: logMessage);

  Future<MediaProgress> getMediaProgress({
    required String libraryItemId,
    String? episodeId,
  }) {
    return _call(
      () => _api.getMediaProgress(
        libraryItemId: libraryItemId,
        episodeId: episodeId,
      ),
    );
  }

  Future<void> upsertMediaProgress({
    required String libraryItemId,
    String? episodeId,
    UpsertProgressRequestParams? params,
  }) {
    return _call(
      () => _api.upsertMediaProgress(
        libraryItemId: libraryItemId,
        episodeId: episodeId,
        params: params,
      ),
    );
  }

  Future<void> removeMediaProgress({required String mediaProgressId}) {
    return _call(
      () => _api.removeMediaProgress(mediaProgressId: mediaProgressId),
    );
  }

  Future<User> removeFromContinueListening({required String mediaProgressId}) {
    return _call(
      () => _api.removeFromContinueListening(mediaProgressId: mediaProgressId),
    );
  }

  Future<User> removeSeriesFromContinueListening({required String seriesId}) {
    return _call(
      () => _api.removeSeriesFromContinueListening(seriesId: seriesId),
    );
  }

  Future<User> reAddSeriesToContinueListening({required String seriesId}) {
    return _call(() => _api.reAddSeriesToContinueListening(seriesId: seriesId));
  }

  Future<AudioBookmark> createBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) {
    return _call(
      () => _api.createBookmark(
        libraryItemId: libraryItemId,
        time: time,
        title: title,
      ),
    );
  }

  Future<AudioBookmark> updateBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) {
    return _call(
      () => _api.updateBookmark(
        libraryItemId: libraryItemId,
        time: time,
        title: title,
      ),
    );
  }

  Future<void> removeBookmark({
    required String libraryItemId,
    required Duration time,
  }) {
    return _call(
      () => _api.removeBookmark(libraryItemId: libraryItemId, time: time),
    );
  }

  Future<UserStatsResponse> getStats() {
    return _call(_api.getStats, logMessage: 'Error fetching stats');
  }

  Future<List<LibraryItem>> getItemsInProgress({int limit = 25}) {
    return _call(() => _api.getItemsInProgress(limit: limit));
  }

  Future<User> getUser() {
    return _call(_api.getUser, logMessage: 'Error fetching user');
  }

  Future<UserSessionsResponse> getSessions({
    int itemsPerPage = 10,
    int page = 0,
  }) {
    return _call(
      () => _api.getSessions(itemsPerPage: itemsPerPage, page: page),
    );
  }
}
