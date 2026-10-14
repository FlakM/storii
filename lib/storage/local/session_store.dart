import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'session_store.g.dart';

class SessionStore {
  const new();

  Future<void> save(PlaybackSession session) async {
    await localSessionsBox.put(session.id, jsonEncode(session));
  }

  Future<void> delete(String sessionId) async {
    await localSessionsBox.delete(sessionId);
  }

  List<PlaybackSession> getAll() {
    return localSessionsBox.values.map(_parseSession).toList();
  }

  PlaybackSession? getSession(String itemId, [String? episodeId]) {
    return localSessionsBox.values
        .map(_parseSession)
        .firstWhereOrNull(
          (s) => s.libraryItemId == itemId && s.episodeId == episodeId,
        );
  }
}

@riverpod
SessionStore sessionStore(Ref ref) => const SessionStore();

@riverpod
Stream<List<PlaybackSession>> localSessions(Ref ref) {
  final items = localSessionsBox.values.map(_parseSession).toList();
  return localSessionsBox
      .watch()
      .map((_) => localSessionsBox.values.map(_parseSession).toList())
      .startWith(items);
}

@riverpod
Stream<PlaybackSession?> localSessionById(
  Ref ref,
  String itemId, [
  String? episodeId,
]) {
  final session = ref.read(sessionStoreProvider).getSession(itemId, episodeId);
  return localSessionsBox
      .watch()
      .map((_) => ref.read(sessionStoreProvider).getSession(itemId, episodeId))
      .startWith(session);
}

PlaybackSession _parseSession(String json) =>
    PlaybackSession.fromJson(jsonDecode(json));
