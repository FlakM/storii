import 'package:storii/api/abs/models/models.dart';
import 'package:storii/api/abs/socket/events/socket_events.dart';

class PlaylistEvents extends SocketEvents {
  new(super.socket);

  Stream<Playlist> _onPlaylistEvent(String event) =>
      onJson('playlist_$event', (json) => fromJson(json, Playlist.fromJson));

  Stream<Playlist> get onPlaylistAdded => _onPlaylistEvent('added');

  Stream<Playlist> get onPlaylistUpdated => _onPlaylistEvent('updated');

  Stream<Playlist> get onPlaylistRemoved => _onPlaylistEvent('removed');
}
