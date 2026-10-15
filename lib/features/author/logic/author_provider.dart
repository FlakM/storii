import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/media_progress_map_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';

part 'author_provider.g.dart';

@riverpod
Future<Author> author(Ref ref, String authorId) async {
  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;

  final repo = ref.read(libraryRepositoryProvider);
  final progressMap = await ref.watch(mediaProgressMapProvider.future);

  final author = await repo.getAuthor(authorId, libraryId);
  final seriesBookIds = (author.series ?? [])
      .expand((s) => s.books)
      .map((item) => item.id)
      .toSet();
  final standaloneBooks = (author.libraryItems ?? [])
      .where((book) => !seriesBookIds.contains(book.id))
      .toList();
  return author.copyWith(
    series: author.series
        ?.map(
          (s) => s.copyWith(
            books: s.books
                .map((i) => i.copyWith(userMediaProgress: progressMap[i.id]))
                .toList(),
          ),
        )
        .toList(),
    libraryItems: standaloneBooks
        .map((i) => i.copyWith(userMediaProgress: progressMap[i.id]))
        .toList(),
  );
}
