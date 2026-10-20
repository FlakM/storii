import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';

part 'stats_provider.g.dart';

@riverpod
Future<UserStatsResponse> stats(Ref ref) async {
  final user = await ref.watch(authenticatedUserProvider.future);
  final repo = ref.watch(meRepositoryProvider(user));
  return repo.getStats();
}
