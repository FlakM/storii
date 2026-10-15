import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/audio_meta_tags.dart';
import 'package:storii/api/abs/models/book_chapter.dart';
import 'package:storii/api/abs/models/file_metadata.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'audio_track.freezed.dart';
part 'audio_track.g.dart';

@freezed
sealed class AudioTrack with _$AudioTrack {
  @DateTimeEpochConverter()
  @DurationPreciseSecondsConverter()
  const factory({
    required int index,
    required Duration startOffset,
    required Duration duration,
    required String title,
    required String contentUrl,
    String? mimeType,
    FileMetadata? metadata,
    String? ino,
    DateTime? addedAt,
    DateTime? updatedAt,
    int? trackNumFromMeta,
    int? discNumFromMeta,
    int? trackNumFromFilename,
    int? discNumFromFilename,
    bool? manuallyVerified,
    bool? exclude,
    String? error,
    String? format,
    int? bitRate,
    String? language,
    String? codec,
    String? timeBase,
    int? channels,
    String? channelLayout,
    List<BookChapter>? chapters,
    String? embeddedCoverArt,
    AudioMetaTags? metaTags,
  }) = _AudioTrack;

  factory fromJson(Map<String, dynamic> json) => _$AudioTrackFromJson(json);
}
