import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/media_progress.dart';

part 'user_item_progress_updated_event.freezed.dart';
part 'user_item_progress_updated_event.g.dart';

@freezed
abstract class UserItemProgressUpdatedEvent
    with _$UserItemProgressUpdatedEvent {
  const factory({
    required String id,
    required String sessionId,
    required String deviceDescription,
    required MediaProgress data,
  }) = _UserItemProgressUpdatedEvent;

  factory fromJson(Map<String, dynamic> json) =>
      _$UserItemProgressUpdatedEventFromJson(json);
}
