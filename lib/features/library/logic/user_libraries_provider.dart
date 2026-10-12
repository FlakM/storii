import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'user_libraries_provider.g.dart';

@riverpod
Future<List<Library>> userLibraries(Ref ref) async {
  await ref.watch(authGateProvider.future);
  final api = ref.read(libraryApiProvider);

  return ref.logApiCall(
    api.getAll,
    logMessage: 'Error fetching user libraries',
    source: 'userLibraries',
  );
}
