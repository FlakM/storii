import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class SessionRepository {
  final ItemApi _itemApi;
  final SessionsApi _sessionsApi;
  const new(this._itemApi, this._sessionsApi);

  static const _source = 'SessionRepository';

  Future<PlaybackSession> createSession({
    required String itemId,
    String? episodeId,
    required PlayItemRequestParams params,
  }) {
    return logApiCall(
      () => _itemApi.createSession(
        libraryItemId: itemId,
        episodeId: episodeId,
        params: params,
      ),
      source: _source,
    );
  }

  Future<void> syncSession({
    required String sessionId,
    required SyncSessionRequestParams params,
  }) {
    return logApiCall(
      () => _sessionsApi.syncSession(sessionId: sessionId, params: params),
      source: _source,
    );
  }

  Future<void> closeSession({
    required String sessionId,
    SyncSessionRequestParams? params,
  }) {
    return logApiCall(
      () => _sessionsApi.closeSession(sessionId: sessionId, params: params),
      source: _source,
    );
  }

  Future<PlaybackSession> getSession({required String sessionId}) {
    return logApiCall(
      () => _sessionsApi.getSession(sessionId: sessionId),
      source: _source,
    );
  }

  Future<void> syncLocal({required PlaybackSession localSession}) {
    return logApiCall(
      () => _sessionsApi.syncLocal(localSession: localSession),
      source: _source,
    );
  }

  Future<List<SyncLocalSessionResponse>> syncLocalSessions({
    required List<PlaybackSession> localSessions,
  }) {
    return logApiCall(
      () => _sessionsApi.syncLocalSessions(localSessions: localSessions),
      source: _source,
    );
  }
}
