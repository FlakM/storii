import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/app/providers/auth_gate_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'stats_provider.g.dart';

@riverpod
Future<UserStatsResponse> stats(Ref ref) async {
  await ref.watch(authGateProvider.future);
  final api = ref.read(meApiProvider);
  return ref.logApiCall(
    api.getStats,
    source: 'stats',
    logMessage: 'fetching stats failed',
  );
}
