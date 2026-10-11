import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/playback_session.dart';

part 'user_sessions_response.freezed.dart';
part 'user_sessions_response.g.dart';

@freezed
abstract class UserSessionsResponse with _$UserSessionsResponse {
  const factory({
    required int total,
    required int numPages,
    required int itemsPerPage,
    required List<PlaybackSession> sessions,
  }) = _UserSessionsResponse;

  factory fromJson(Map<String, dynamic> json) =>
      _$UserSessionsResponseFromJson(json);
}
