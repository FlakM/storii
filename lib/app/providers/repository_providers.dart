import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/repositories/item_repository.dart';
import 'package:storii/app/repositories/library_repository.dart';
import 'package:storii/app/repositories/me_repository.dart';
import 'package:storii/app/repositories/session_repository.dart';

part 'repository_providers.g.dart';

@riverpod
LibraryRepository libraryRepository(Ref ref) {
  final api = ref.read(libraryApiProvider);
  return LibraryRepository(api);
}

@riverpod
ItemRepository itemRepository(Ref ref) {
  final api = ref.read(itemApiProvider);
  final serverUrl = ref.read(activeServerUrlProvider);
  return ItemRepository(api, serverUrl: serverUrl);
}

@riverpod
MeRepository meRepository(Ref ref) {
  final api = ref.read(meApiProvider);
  return MeRepository(api);
}

@riverpod
SessionRepository sessionRepository(Ref ref) {
  final itemApi = ref.read(itemApiProvider);
  final sessionsApi = ref.read(sessionsApiProvider);
  return SessionRepository(itemApi, sessionsApi);
}
