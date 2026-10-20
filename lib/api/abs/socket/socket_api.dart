import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:storii/api/abs/socket/events/collection_events.dart';
import 'package:storii/api/abs/socket/events/item_events.dart';
import 'package:storii/api/abs/socket/events/playlist_events.dart';
import 'package:storii/api/abs/socket/events/task_events.dart';
import 'package:storii/api/abs/socket/events/user_events.dart';

class SocketApi {
  final Socket socket;

  late final StreamSubscription<String?> _tokenSub;
  late final StreamController<bool> _connController;
  final Function? onAuthFailure;

  late final UserSocketEvents user;
  late final TaskEvents taskEvents;
  late final CollectionEvents collectionEvents;
  late final PlaylistEvents playlistEvents;
  late final ItemEvents itemEvents;

  late final Stream<bool> isConnected;

  String? _currentToken;
  bool _isDisposed = false;
  final Future<String?> Function()? getToken;

  new({
    required String baseUrl,
    required String? token,
    required Stream<String?> tokenUpdates,
    this.getToken,
    this.onAuthFailure,
  }) : socket = io(
         baseUrl,
         OptionBuilder()
             .setTransports(['websocket'])
             .disableAutoConnect()
             .build(),
       ),
       _currentToken = token {
    user = UserSocketEvents(socket);
    taskEvents = TaskEvents(socket);
    collectionEvents = CollectionEvents(socket);
    playlistEvents = PlaylistEvents(socket);
    itemEvents = ItemEvents(socket);

    _connController = StreamController<bool>.broadcast();
    isConnected = _connController.stream;

    socket.onConnect((_) async {
      if (_isDisposed) return;
      _connController.add(true);
      // Always authenticate with the token currently in storage: it may have
      // been refreshed while the socket was disconnected.
      final latestToken = await getToken?.call();
      if (_isDisposed) return;
      if (latestToken != null) _currentToken = latestToken;
      _authenticate();
    });
    socket.onDisconnect((_) {
      if (_isDisposed) return;
      _connController.add(false);
      // Keep _currentToken: socket.io reconnects on its own and _authenticate()
      // must still have a token when it does. Nulling it here made every
      // reconnect unauthenticated until the app process was restarted.
    });
    socket.onConnectError((_) {
      if (_isDisposed) return;
      _connController.add(false);
    });
    socket.on('auth_failed', (_) {
      // Keep the token so a reconnect after a token refresh can authenticate.
      // onAuthFailure triggers a refresh; the new token arrives via tokenUpdates.
      return onAuthFailure?.call();
    });

    _tokenSub = tokenUpdates.listen(_onTokenUpdate);

    socket.connect();
  }

  void _authenticate() {
    final token = _currentToken;

    if (token != null) {
      socket.emit('auth', token);
    }
  }

  void _onTokenUpdate(String? newToken) {
    _currentToken = newToken;

    if (socket.connected && newToken != null) {
      _authenticate();
    }
  }

  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _tokenSub.cancel();
    _connController.close();
    socket.dispose();
  }
}
