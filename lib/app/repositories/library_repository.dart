import 'package:flutter/foundation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class LibraryRepository {
  final LibraryApi _api;
  final Future<void> auth;
  const new(this._api, {required this.auth});

  static const _source = 'LibraryRepository';

  Future<T> _call<T>(Future<T> Function() call, {String? logMessage}) =>
      callWithAuth(auth, call, source: _source, logMessage: logMessage);

  Future<List<Library>> getLibraries() {
    return _call(_api.getAll, logMessage: 'Error fetching user libraries');
  }

  Future<LibraryResponse> get(String libraryId) {
    return _call(
      () => _api.get(libraryId),
      logMessage: 'Error fetching active library details',
    );
  }

  Future<LibraryItemsResponse> getItems(
    String libraryId,
    LibraryItemsRequestParams? params,
  ) {
    return _call(
      () => _api.getItems(libraryId, params),
      logMessage: 'Error fetching items',
    );
  }

  Future<List<LibraryItem>> getAllItems(
    String libraryId,
    LibraryItemsRequestParams? params,
  ) {
    return _call(() async {
      final data = await _api.getItemsRaw(libraryId, params);
      final response = await compute(LibraryItemsResponse.fromJson, data);
      return response.results;
    }, logMessage: 'Error fetching all items');
  }

  Future<List<Shelf>> getShelves(String libraryId) {
    return _call(
      () => _api.getPersonalized(libraryId),
      logMessage: 'Error getting personalized home',
    );
  }

  Future<RecentEpisodesResponse> getRecentEpisodes(
    String libraryId, {
    int limit = 50,
    int page = 0,
  }) {
    return _call(
      () => _api.getRecentEpisodes(libraryId, limit: limit, page: page),
      logMessage: 'Error fetching recent episodes',
    );
  }

  Future<SearchResponse> search(
    String libraryId, {
    required String query,
    int? limit,
  }) {
    return _call(
      () => _api.search(libraryId, query: query, limit: limit),
      logMessage: 'Error getting search results',
    );
  }

  Future<SeriesResponse> getSeries(
    String libraryId,
    SeriesRequestParams? params,
  ) {
    return _call(
      () => _api.getSeries(libraryId, params),
      logMessage: 'Error fetching series list',
    );
  }

  Future<Series> getSeriesById(String libraryId, String seriesId) {
    return _call(
      () => _api.getSeriesById(libraryId, seriesId),
      logMessage: 'Error fetching series detail',
    );
  }

  Future<Author> getAuthor(String authorId, String libraryId) {
    return _call(
      () => _api.getAuthor(authorId, libraryId),
      logMessage: 'Error fetching author detail',
    );
  }

  Future<List<Author>> getAuthors(
    String libraryId,
    AuthorsRequestParams? params,
  ) {
    return _call(
      () => _api.getAuthors(libraryId, params),
      logMessage: 'Error getting authors',
    );
  }

  Future<void> scanLibrary(String libraryId, {bool forceScan = false}) {
    return _call(
      () => _api.scan(libraryId, forceScan: forceScan),
      logMessage: 'Error scanning library',
    );
  }
}
