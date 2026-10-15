import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/podcast_episode_enclosure.dart';

part 'podcast_feed_episode.freezed.dart';
part 'podcast_feed_episode.g.dart';

@freezed
sealed class PodcastFeedEpisode with _$PodcastFeedEpisode {
  @DateTimeEpochConverter()
  const factory({
    required String title,
    required String subtitle,
    required String description,
    required String descriptionPlain,
    required String pubDate,
    required String episodeType,
    required String season,
    required String episode,
    required String author,
    required String duration,
    required String explicit,
    required DateTime publishedAt,
    required PodcastEpisodeEnclosure enclosure,
  }) = _PodcastFeedEpisode;

  factory fromJson(Map<String, dynamic> json) =>
      _$PodcastFeedEpisodeFromJson(json);
}
