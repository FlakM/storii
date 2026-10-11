import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/library_item.dart';
import 'package:storii/api/abs/models/podcast_episode.dart';

part 'playlist_item.freezed.dart';
part 'playlist_item.g.dart';

@freezed
sealed class PlaylistItem with _$PlaylistItem {
  const factory({
    required String libraryItemId,
    String? episodeId,
    PodcastEpisode? episode,
    LibraryItem? libraryItem,
  }) = _PlaylistItem;

  factory fromJson(Map<String, dynamic> json) => _$PlaylistItemFromJson(json);
}
