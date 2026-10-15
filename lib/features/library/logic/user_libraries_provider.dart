import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/repository_providers.dart';

part 'user_libraries_provider.g.dart';

@riverpod
Future<List<Library>> userLibraries(Ref ref) async {
  final repo = ref.read(libraryRepositoryProvider);
  return repo.getLibraries();
}
