import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';

part 'user_libraries_provider.g.dart';

@riverpod
Future<List<Library>> userLibraries(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final repo = ref.watch(libraryRepositoryProvider(user));
  return repo.getLibraries();
}
