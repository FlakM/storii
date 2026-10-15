import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/playlist_item.dart';

part 'playlist.freezed.dart';
part 'playlist.g.dart';

@freezed
abstract class Playlist with _$Playlist {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String name,
    required String libraryId,
    required String userId,
    String? description,
    required DateTime lastUpdate,
    required DateTime createdAt,
    required List<PlaylistItem> items,
  }) = _Playlist;

  factory fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
}
