import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/podcast_feed_episode.dart';
import 'package:storii/api/abs/models/podcast_feed_metadata.dart';

part 'podcast_feed.freezed.dart';
part 'podcast_feed.g.dart';

@freezed
sealed class PodcastFeed with _$PodcastFeed {
  const factory({
    required PodcastFeedMetadata metadata,
    List<PodcastFeedEpisode>? episodes,
  }) = _PodcastFeed;

  factory fromJson(Map<String, dynamic> json) => _$PodcastFeedFromJson(json);
}
