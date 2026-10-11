import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/json_helpers.dart';

part 'upsert_progress_request_params.g.dart';

@requestToJsonRemoveNull
class UpsertProgressRequestParams {
  final Duration? duration;
  final double? progress;
  final Duration? currentTime;
  final bool? isFinished;
  final bool? hideFromContinueListening;
  final DateTime? finishedAt;
  final DateTime? startedAt;

  const new({
    this.duration,
    this.progress,
    this.currentTime,
    this.isFinished,
    this.hideFromContinueListening,
    this.finishedAt,
    this.startedAt,
  });

  Map<String, dynamic>? toJson() =>
      _$UpsertProgressRequestParamsToJson(this).nullIfEmpty;
}
