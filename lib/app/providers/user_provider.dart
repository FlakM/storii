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
  @override
  Future<User> build() async {
    final user = await ref.watch(authenticatedUserProvider.future);
    final repo = ref.watch(meRepositoryProvider(user));
    final serverUser = await repo.getUser();

    ref.listen(_userUpdateProvider, (_, next) {
      final updatedUser = next.value;
      if (updatedUser != null) {
        state = AsyncData(updatedUser);
      }
    });

    return serverUser;
  }
}

@riverpod
Stream<User> _userUpdate(Ref ref) async* {
  final user = ref.watch(currentUserProvider);
  if (user == null) return;
  final socket = await ref.watch(socketApiProvider(user).future);
  yield* socket.user.onUserUpdated;
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
