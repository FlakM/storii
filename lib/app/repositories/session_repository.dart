import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class SessionRepository {
  final ItemApi _itemApi;
  final SessionsApi _sessionsApi;
  final Future<void> auth;
  const new(this._itemApi, this._sessionsApi, {required this.auth});

  static const _source = 'SessionRepository';

  Future<T> _call<T>(Future<T> Function() call, {String? logMessage}) =>
      callWithAuth(auth, call, source: _source, logMessage: logMessage);

  Future<PlaybackSession> createSession({
    required String itemId,
    String? episodeId,
    required PlayItemRequestParams params,
  }) {
    return _call(
      () => _itemApi.createSession(
        libraryItemId: itemId,
        episodeId: episodeId,
        params: params,
      ),
    );
  }

  Future<void> syncSession({
    required String sessionId,
    required SyncSessionRequestParams params,
  }) {
    return _call(
      () => _sessionsApi.syncSession(sessionId: sessionId, params: params),
    );
  }

  Future<void> closeSession({
    required String sessionId,
    SyncSessionRequestParams? params,
  }) {
    return _call(
      () => _sessionsApi.closeSession(sessionId: sessionId, params: params),
    );
  }

  Future<PlaybackSession> getSession({required String sessionId}) {
    return _call(() => _sessionsApi.getSession(sessionId: sessionId));
  }

  Future<void> syncLocal({required PlaybackSession localSession}) {
    return _call(() => _sessionsApi.syncLocal(localSession: localSession));
  }

  Future<List<SyncLocalSessionResponse>> syncLocalSessions({
    required List<PlaybackSession> localSessions,
  }) {
    return _call(
      () => _sessionsApi.syncLocalSessions(localSessions: localSessions),
    );
  }
}
