import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/local/server_settings_store.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'user_provider.g.dart';

@riverpod
class ServerUser extends _$ServerUser {
  StreamSubscription? _userSub;

  @override
  Future<User> build() async {
    ref.onDispose(() {
      _userSub?.cancel();
    });
    await _userSub?.cancel();
    final userDomain = await ref.watch(authenticatedUserProvider.future);
    final repo = ref.watch(meRepositoryProvider(userDomain));
    final serverUser = await repo.getUser();

    final socket = await ref.watch(socketApiProvider(userDomain).future);
    _userSub = socket.user.onUserUpdated.listen((update) {
      state = AsyncData(update);
    });

    return serverUser;
  }
}

@riverpod
Future<UserPermissions?> userPermissions(Ref ref) async {
  final user = await ref.watch(serverUserProvider.future);
  return user.permissions;
}

@riverpod
bool isUserAdmin(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return false;
  final type = UserType.values.firstWhereOrNull((t) => t.name == user.userType);
  if (type == null) return false;
  return type.isAdmin;
}

@riverpod
ServerSettings? currentServerSettings(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return null;
  final serverId = ref.read(serversStoreProvider).get(user.serverUrl)?.id;
  if (serverId == null) return null;
  return ref.watch(serverSettingsProvider(serverId)).value;
}

@riverpod
Future<bool> canUserUpdate(Ref ref) async {
  final permissions = await ref.watch(userPermissionsProvider.future);
  return permissions?.update ?? false;
}

@riverpod
Future<bool> canUserDelete(Ref ref) async {
  final permissions = await ref.watch(userPermissionsProvider.future);
  return permissions?.delete ?? false;
}
