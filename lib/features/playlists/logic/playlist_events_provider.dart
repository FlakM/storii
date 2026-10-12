import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';

part 'playlist_events_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Playlist> playlistAdded(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.playlistEvents.onPlaylistAdded;
}

@Riverpod(keepAlive: true)
Stream<Playlist> playlistUpdated(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.playlistEvents.onPlaylistUpdated;
}

@Riverpod(keepAlive: true)
Stream<Playlist> playlistRemoved(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.playlistEvents.onPlaylistRemoved;
}
