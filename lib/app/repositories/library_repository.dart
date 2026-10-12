import 'package:flutter/foundation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class LibraryRepository {
  final LibraryApi _api;
  const new(this._api);

  static const _source = 'LibraryRepository';

  Future<List<Library>> getLibraries() {
    return logApiCall(
      _api.getAll,
      source: _source,
      logMessage: 'Error fetching user libraries',
    );
  }

  Future<LibraryResponse> get(String libraryId) {
    return logApiCall(
      () => _api.get(libraryId),
      source: _source,
      logMessage: 'Error fetching active library details',
    );
  }

  Future<LibraryItemsResponse> getItems(
    String libraryId,
    LibraryItemsRequestParams? params,
  ) {
    return logApiCall(
      () => _api.getItems(libraryId, params),
      source: _source,
      logMessage: 'Error fetching items',
    );
  }

  Future<List<LibraryItem>> getAllItems(
    String libraryId,
    LibraryItemsRequestParams? params,
  ) {
    return logApiCall(
      () async {
        final data = await _api.getItemsRaw(libraryId, params);
        final response = await compute(LibraryItemsResponse.fromJson, data);
        return response.results;
      },
      source: _source,
      logMessage: 'Error fetching all items',
    );
  }

  Future<List<Shelf>> getShelves(String libraryId) {
    return logApiCall(
      () => _api.getPersonalized(libraryId),
      source: _source,
      logMessage: 'Error getting personalized home',
    );
  }

  Future<RecentEpisodesResponse> getRecentEpisodes(
    String libraryId, {
    int limit = 50,
    int page = 0,
  }) {
    return logApiCall(
      () => _api.getRecentEpisodes(libraryId, limit: limit, page: page),
      source: _source,
      logMessage: 'Error fetching recent episodes',
    );
  }

  Future<SearchResponse> search(
    String libraryId, {
    required String query,
    int? limit,
  }) {
    return logApiCall(
      () => _api.search(libraryId, query: query, limit: limit),
      source: _source,
      logMessage: 'Error getting search results',
    );
  }

  Future<SeriesResponse> getSeries(
    String libraryId,
    SeriesRequestParams? params,
  ) {
    return logApiCall(
      () => _api.getSeries(libraryId, params),
      source: _source,
      logMessage: 'Error fetching series list',
    );
  }

  Future<Series> getSeriesById(String libraryId, String seriesId) {
    return logApiCall(
      () => _api.getSeriesById(libraryId, seriesId),
      source: _source,
      logMessage: 'Error fetching series detail',
    );
  }

  Future<Author> getAuthor(String authorId, String libraryId) {
    return logApiCall(
      () => _api.getAuthor(authorId, libraryId),
      source: _source,
      logMessage: 'Error fetching author detail',
    );
  }

  Future<List<Author>> getAuthors(
    String libraryId,
    AuthorsRequestParams? params,
  ) {
    return logApiCall(
      () => _api.getAuthors(libraryId, params),
      source: _source,
      logMessage: 'Error getting authors',
    );
  }

  Future<void> scanLibrary(String libraryId, {bool forceScan = false}) {
    return logApiCall(
      () => _api.scan(libraryId, forceScan: forceScan),
      source: _source,
      logMessage: 'Error scanning library',
    );
  }
}
