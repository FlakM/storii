import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class MeRepository {
  final MeApi _api;
  const new(this._api);

  static const _source = 'MeRepository';

  Future<MediaProgress> getMediaProgress({
    required String libraryItemId,
    String? episodeId,
  }) {
    return logApiCall(
      () => _api.getMediaProgress(
        libraryItemId: libraryItemId,
        episodeId: episodeId,
      ),
      source: _source,
    );
  }

  Future<void> upsertMediaProgress({
    required String libraryItemId,
    String? episodeId,
    UpsertProgressRequestParams? params,
  }) {
    return logApiCall(
      () => _api.upsertMediaProgress(
        libraryItemId: libraryItemId,
        episodeId: episodeId,
        params: params,
      ),
      source: _source,
    );
  }

  Future<void> removeMediaProgress({required String mediaProgressId}) {
    return logApiCall(
      () => _api.removeMediaProgress(mediaProgressId: mediaProgressId),
      source: _source,
    );
  }

  Future<User> removeFromContinueListening({required String mediaProgressId}) {
    return logApiCall(
      () => _api.removeFromContinueListening(mediaProgressId: mediaProgressId),
      source: _source,
    );
  }

  Future<User> removeSeriesFromContinueListening({required String seriesId}) {
    return logApiCall(
      () => _api.removeSeriesFromContinueListening(seriesId: seriesId),
      source: _source,
    );
  }

  Future<User> reAddSeriesToContinueListening({required String seriesId}) {
    return logApiCall(
      () => _api.reAddSeriesToContinueListening(seriesId: seriesId),
      source: _source,
    );
  }

  Future<AudioBookmark> createBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) {
    return logApiCall(
      () => _api.createBookmark(
        libraryItemId: libraryItemId,
        time: time,
        title: title,
      ),
      source: _source,
    );
  }

  Future<AudioBookmark> updateBookmark({
    required String libraryItemId,
    required Duration time,
    required String title,
  }) {
    return logApiCall(
      () => _api.updateBookmark(
        libraryItemId: libraryItemId,
        time: time,
        title: title,
      ),
      source: _source,
    );
  }

  Future<void> removeBookmark({
    required String libraryItemId,
    required Duration time,
  }) {
    return logApiCall(
      () => _api.removeBookmark(libraryItemId: libraryItemId, time: time),
      source: _source,
    );
  }

  Future<UserStatsResponse> getStats() {
    return logApiCall(
      _api.getStats,
      source: _source,
      logMessage: 'Error fetching stats',
    );
  }

  Future<List<LibraryItem>> getItemsInProgress({int limit = 25}) {
    return logApiCall(
      () => _api.getItemsInProgress(limit: limit),
      source: _source,
    );
  }

  Future<User> getUser() {
    return logApiCall(
      _api.getUser,
      source: _source,
      logMessage: 'Error fetching user',
    );
  }

  Future<UserSessionsResponse> getSessions({
    int itemsPerPage = 10,
    int page = 0,
  }) {
    return logApiCall(
      () => _api.getSessions(itemsPerPage: itemsPerPage, page: page),
      source: _source,
    );
  }
}
