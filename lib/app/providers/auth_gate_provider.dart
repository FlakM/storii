import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/features/auth/logic/users_provider.dart';
import 'package:storii/shared/helpers/app_error.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';
import 'package:storii/storage/local/server_settings_store.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'auth_gate_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> authGate(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');
  try {
    await _authorizeAndPersist(ref, user);
  } on AppError catch (error) {
    if (error.type == .network || error.type == .timeout) return;
    rethrow;
  }
}

@Riverpod(keepAlive: true)
class AuthRefresher extends _$AuthRefresher {
  @override
  void build() {
    ref.listen(serverConnectionProvider, (prev, next) {
      final wasConnected = prev ?? false;
      if (wasConnected || !next) return;
      unawaited(_refresh());
    });
  }

  Future<void> _refresh() async {
    final gate = ref.read(authGateProvider);
    if (gate.hasError) {
      ref.invalidate(authGateProvider);
      return;
    }
    final user = ref.read(currentUserProvider);
    if (user == null) return;
    try {
      await _authorizeAndPersist(ref, user);
    } on AppError catch (error) {
      LogService.log(
        'Re-auth after reconnect failed: ${error.message}',
        source: 'AuthRefresher',
      );
    }
  }
}

Future<void> _authorizeAndPersist(Ref ref, UserDomain user) async {
  final response = await ref.logApiCall(
    () async => ref.read(serverApiProvider).authorize(),
    source: 'authGate',
    logMessage: 'Error authenticating user',
    debug: true,
  );
  LogService.log('user auth success!', source: 'authGate');
  final serverId = ref
      .read(serversStoreProvider.notifier)
      .get(user.serverUrl)
      ?.id;
  if (serverId != null) {
    await ref
        .read(serverSettingsStoreProvider.notifier)
        .save(serverId, response.serverSettings);
  }
  final refreshed = UserDomain(
    id: user.id,
    username: response.user.username,
    userType: response.user.type.name,
    serverUrl: user.serverUrl,
  );
  if (refreshed != user) {
    await ref.read(usersProvider.notifier).add(refreshed);
  }
}
