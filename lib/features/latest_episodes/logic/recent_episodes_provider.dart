import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';

part 'recent_episodes_provider.g.dart';

@riverpod
Future<List<PodcastEpisode>> recentEpisodes(Ref ref) async {
  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;

  final user = await ref.watch(authenticatedUserProvider.future);
  final repo = ref.watch(libraryRepositoryProvider(user));

  final response = await repo.getRecentEpisodes(libraryId);
  return response.episodes;
}
