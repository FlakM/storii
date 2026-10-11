import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/rss_feed_episode.dart';
import 'package:storii/api/abs/models/rss_feed_metadata.dart';

part 'rss_feed.freezed.dart';
part 'rss_feed.g.dart';

@freezed
sealed class RssFeed with _$RssFeed {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String entityId,
    required String entityType,
    required Uri feedUrl,
    String? slug,
    String? userId,
    String? coverPath,
    Uri? serverAddress,
    RssFeedMetadata? meta,
    List<RssFeedEpisode>? episodes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RssFeed;

  factory fromJson(Map<String, dynamic> json) => _$RssFeedFromJson(json);
}
