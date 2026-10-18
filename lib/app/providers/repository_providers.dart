import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/models/user.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/repositories/item_repository.dart';
import 'package:storii/app/repositories/library_repository.dart';
import 'package:storii/app/repositories/me_repository.dart';
import 'package:storii/app/repositories/session_repository.dart';

part 'repository_providers.g.dart';

@riverpod
LibraryRepository libraryRepository(Ref ref, UserDomain user) {
  return LibraryRepository(ref.watch(libraryApiProvider(user)));
}

@riverpod
ItemRepository itemRepository(Ref ref, UserDomain user) {
  return ItemRepository(
    ref.watch(itemApiProvider(user)),
    serverUrl: ref.watch(activeServerUrlProvider),
  );
}

@riverpod
MeRepository meRepository(Ref ref, UserDomain user) {
  return MeRepository(ref.watch(meApiProvider(user)));
}

@riverpod
SessionRepository sessionRepository(Ref ref, UserDomain user) {
  return SessionRepository(
    ref.watch(itemApiProvider(user)),
    ref.watch(sessionsApiProvider(user)),
  );
}
