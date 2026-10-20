import 'package:flutter_test/flutter_test.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:storii/api/abs/socket/socket_api.dart';

/// Minimal [Socket] stand-in: records auth emits and lets the test drive the
/// connect/disconnect events the real transport would produce.
class FakeSocket implements Socket {
  final Map<String, List<Function>> _handlers = {};
  final List<Object?> authTokens = [];
  @override
  bool connected = false;

  @override
  Function() on(String event, Function handler) {
    (_handlers[event] ??= []).add(handler);
    return () {};
  }

  @override
  void emit(String event, [dynamic data]) {
    if (event == 'auth') authTokens.add(data);
  }

  @override
  Socket connect() => this;

  @override
  void dispose() {}

  void fire(String event, [Object? data]) {
    for (final handler in _handlers[event] ?? const <Function>[]) {
      handler(data);
    }
  }

  void simulateConnect() {
    connected = true;
    fire('connect');
  }

  void simulateDisconnect() {
    connected = false;
    fire('disconnect');
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  SocketApi buildApi(FakeSocket socket, {required String token}) => SocketApi(
    baseUrl: 'http://localhost',
    token: token,
    tokenUpdates: const Stream<String?>.empty(),
    getToken: () async => token,
    socketOverride: socket,
  );

  test('re-authenticates with the current token after a disconnect', () async {
    var token = 'access-1';
    final socket = FakeSocket();
    final api = SocketApi(
      baseUrl: 'http://localhost',
      token: token,
      tokenUpdates: const Stream<String?>.empty(),
      getToken: () async => token,
      socketOverride: socket,
    );
    addTearDown(api.dispose);

    socket.simulateConnect();
    await pumpEventQueue();
    expect(socket.authTokens, ['access-1']);

    socket.simulateDisconnect();

    // The token may be refreshed while the socket is down.
    token = 'access-2';
    socket.simulateConnect();
    await pumpEventQueue();

    expect(socket.authTokens, [
      'access-1',
      'access-2',
    ], reason: 'a reconnect must authenticate again, with the latest token');
  });

  test(
    'keeps the token after auth_failed so the next connect can retry',
    () async {
      final socket = FakeSocket();
      final api = buildApi(socket, token: 'access-1');
      addTearDown(api.dispose);

      socket.simulateConnect();
      await pumpEventQueue();
      socket
        ..fire('auth_failed')
        ..simulateDisconnect()
        ..simulateConnect();
      await pumpEventQueue();

      expect(socket.authTokens, [
        'access-1',
        'access-1',
      ], reason: 'auth_failed must not discard the token');
    },
  );
}
