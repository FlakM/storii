import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/library/logic/active_library_provider.dart';
import 'package:storii/features/library/logic/library_filters_provider.dart';

part 'authors_list_provider.g.dart';

@riverpod
Future<List<Author>> authorsList(Ref ref) async {
  final libraryId = (await ref.watch(activeLibraryDetailsProvider.future))
      .library
      .id;
  final params = ref.watch(
    libraryFiltersProvider(.authors).select((s) => s.toAuthorParams()),
  );

  final repo = ref.read(libraryRepositoryProvider);
  return repo.getAuthors(libraryId, params);
}
