import 'package:storii/api/abs/models/models.dart';
import 'package:storii/api/abs/socket/events/socket_events.dart';

class ItemEvents extends SocketEvents {
  new(super.socket);

  Stream<LibraryItem> _onItemEvent(String event) =>
      onJson('item_$event', (json) => fromJson(json, LibraryItem.fromJson));

  // Stream<LibraryItem> get onItemAdded => _onItemEvent('added');

  Stream<LibraryItem> get onItemUpdated => _onItemEvent('updated');
}
