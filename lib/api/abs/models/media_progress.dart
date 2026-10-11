import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'media_progress.freezed.dart';
part 'media_progress.g.dart';

@freezed
sealed class MediaProgress with _$MediaProgress {
  const factory({
    required String id,
    required String libraryItemId,
    String? episodeId,
    @DurationPreciseSecondsConverter() Duration? duration,
    double? progress,
    @DurationPreciseSecondsConverter() Duration? currentTime,
    bool? isFinished,
    bool? hideFromContinueListening,
    @DateTimeEpochConverter() DateTime? lastUpdate,
    @DateTimeEpochConverter() DateTime? startedAt,
    @DateTimeEpochConverter() DateTime? finishedAt,
  }) = _MediaProgress;

  factory fromJson(Map<String, dynamic> json) => _$MediaProgressFromJson(json);
}
