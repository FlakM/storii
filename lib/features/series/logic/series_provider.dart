import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/user_provider.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/shared/helpers/extensions.dart';

part 'series_provider.g.dart';

@riverpod
Future<Series> series(Ref ref, String seriesId) async {
  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;
  final repo = ref.read(libraryRepositoryProvider);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  final results = await Future.wait([
    repo.getItems(
      libraryId,
      LibraryItemsRequestParams(filter: SeriesFilter(seriesId)),
    ),
    repo.getSeriesById(libraryId, seriesId),
  ]);

  final items = (results[0] as LibraryItemsResponse).results;
  final series = results[1] as Series;

  return series.copyWith(
    books: items
        .map(
          (i) => i.copyWith(
            seriesSequence: i.series
                .firstWhereOrNull((s) => s.id == seriesId)
                ?.sequence,
            userMediaProgress: progressMap[i.id],
          ),
        )
        .toList(),
  );
}

@riverpod
bool addToContinueSeries(Ref ref, String seriesId) {
  final user = ref.watch(serverUserProvider).value;
  if (user == null) return false;
  return user.seriesHideFromContinueListening.contains(seriesId);
}
