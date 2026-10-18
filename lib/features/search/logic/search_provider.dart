import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/models/enums.dart';
import 'package:storii/app/providers/authenticated_user_provider.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/shared/helpers/ref_extensions.dart';

part 'search_provider.g.dart';

@riverpod
class SearchFilterNotifier extends _$SearchFilterNotifier {
  @override
  SearchFilter build() => .all;

  void set(SearchFilter filter) {
    state = filter;
  }
}

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  FutureOr<SearchResponse?> build(String query) async {
    ref.invalidateOnReconnect();
    if (query.isEmpty) return null;

    return _fetchSearch(query);
  }

  Future<SearchResponse?> _fetchSearch(String query) async {
    final libraryId = ref.read(currentLibraryProvider)?.id;
    if (libraryId == null) return null;
    final user = await ref.read(authenticatedUserProvider.future);
    final repo = ref.read(libraryRepositoryProvider(user));

    return repo.search(libraryId, query: query);
  }
}
