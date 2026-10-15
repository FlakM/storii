import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/shared/helpers/api_call_logger.dart';

class ItemRepository {
  final ItemApi _api;
  final Future<void> auth;
  final Uri? serverUrl;
  const new(this._api, {required this.auth, this.serverUrl});

  static const _source = 'ItemRepository';

  Future<T> _call<T>(Future<T> Function() call, {String? logMessage}) =>
      callWithAuth(auth, call, source: _source, logMessage: logMessage);

  Future<LibraryItem> getItem(
    String itemId, {
    bool isExpanded = true,
    bool includeProgress = false,
  }) {
    return _call(
      () => _api.get(
        itemId,
        isExpanded: isExpanded,
        includeProgress: includeProgress,
      ),
      logMessage: 'Error fetching library item details',
    );
  }

  Future<Uint8List?> getCover(String itemId, {CancelToken? cancelToken}) {
    return _call(
      () => _api.getCover(
        libraryItemId: itemId,
        cancelToken: cancelToken ?? CancelToken(),
      ),
    );
  }

  Future<ScanItemResult?> scanItem(String itemId) {
    return _call(
      () => _api.scan(libraryItemId: itemId),
      logMessage: 'Error scanning item',
    );
  }

  Future<LibraryItem> updateMetadata(
    String itemId, {
    UpdateItemMediaReqParams? parameters,
  }) {
    return _call(
      () => _api.updateMedia(libraryItemId: itemId, parameters: parameters),
    );
  }

  Future<MatchItemResponse> matchItem(
    String itemId, {
    MatchItemRequestParams? parameters,
  }) {
    return _call(
      () => _api.match(libraryItemId: itemId, parameters: parameters),
    );
  }

  Future<UpdateCoverResponse> uploadCover({
    required String libraryItemId,
    FileUpload? coverFile,
    String? url,
  }) => _call(
    () => _api.uploadCover(
      libraryItemId: libraryItemId,
      coverFile: coverFile,
      url: url,
    ),
  );

  Future<void> removeCover({required String libraryItemId}) =>
      _call(() => _api.removeCover(libraryItemId: libraryItemId));

  Uri? resolveCoverUri(String itemId) => serverUrl
      ?.resolve(ApiRoutes.itemCover(itemId))
      .replace(queryParameters: {'raw': '1'});

  Uri? resolveTrackUri(PlaybackSession session, AudioTrack track) => serverUrl
      ?.resolve(ApiRoutes.sessionOpenTrack(session.id, '${track.index}'));
}
