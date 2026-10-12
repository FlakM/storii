import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class ItemRepository {
  final ItemApi _api;
  final Uri? serverUrl;
  const new(this._api, {this.serverUrl});

  static const _source = 'ItemRepository';

  Future<LibraryItem> getItem(
    String itemId, {
    bool isExpanded = true,
    bool includeProgress = false,
  }) {
    return logApiCall(
      () => _api.get(
        itemId,
        isExpanded: isExpanded,
        includeProgress: includeProgress,
      ),
      source: _source,
      logMessage: 'Error fetching library item details',
    );
  }

  Future<Uint8List?> getCover(String itemId, {CancelToken? cancelToken}) {
    return logApiCall(
      () => _api.getCover(
        libraryItemId: itemId,
        cancelToken: cancelToken ?? CancelToken(),
      ),
      source: _source,
    );
  }

  Future<ScanItemResult?> scanItem(String itemId) {
    return logApiCall(
      () => _api.scan(libraryItemId: itemId),
      source: _source,
      logMessage: 'Error scanning item',
    );
  }

  Future<LibraryItem> updateMetadata(
    String itemId, {
    UpdateItemMediaReqParams? parameters,
  }) {
    return logApiCall(
      () => _api.updateMedia(libraryItemId: itemId, parameters: parameters),
      source: _source,
    );
  }

  Future<MatchItemResponse> matchItem(
    String itemId, {
    MatchItemRequestParams? parameters,
  }) {
    return logApiCall(
      () => _api.match(libraryItemId: itemId, parameters: parameters),
      source: _source,
    );
  }

  Uri? resolveCoverUri(String itemId) => serverUrl
      ?.resolve(ApiRoutes.itemCover(itemId))
      .replace(queryParameters: {'raw': '1'});

  Uri? resolveTrackUri(PlaybackSession session, AudioTrack track) => serverUrl
      ?.resolve(ApiRoutes.sessionOpenTrack(session.id, '${track.index}'));
}
