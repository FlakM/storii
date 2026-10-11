import 'package:storii/api/abs/models/models.dart';
import 'package:storii/api/abs/socket/events/socket_events.dart';

class UserSocketEvents extends SocketEvents {
  new(super.socket);

  Stream<User> get onUserUpdated =>
      onJson('user_updated', (json) => fromJson(json, User.fromJson));

  Stream<UserItemProgressUpdatedEvent> get onProgressUpdate => onJson(
    'user_item_progress_updated',
    (json) => fromJson(json, UserItemProgressUpdatedEvent.fromJson),
  );
}
