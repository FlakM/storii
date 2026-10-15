import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/repositories/item_repository.dart';
import 'package:storii/app/repositories/library_repository.dart';
import 'package:storii/app/repositories/me_repository.dart';
import 'package:storii/app/repositories/session_repository.dart';

part 'repository_providers.g.dart';

@riverpod
LibraryRepository libraryRepository(Ref ref) {
  return LibraryRepository(
    ref.read(libraryApiProvider),
    auth: ref.read(authGateProvider.future),
  );
}

@riverpod
ItemRepository itemRepository(Ref ref) {
  return ItemRepository(
    ref.read(itemApiProvider),
    auth: ref.read(authGateProvider.future),
    serverUrl: ref.read(activeServerUrlProvider),
  );
}

@riverpod
MeRepository meRepository(Ref ref) {
  return MeRepository(
    ref.read(meApiProvider),
    auth: ref.read(authGateProvider.future),
  );
}

@riverpod
SessionRepository sessionRepository(Ref ref) {
  return SessionRepository(
    ref.read(itemApiProvider),
    ref.read(sessionsApiProvider),
    auth: ref.read(authGateProvider.future),
  );
}
