import 'package:storii/api/abs/models/models.dart';
import 'package:storii/api/abs/socket/events/socket_events.dart';

class CollectionEvents extends SocketEvents {
  new(super.socket);

  Stream<Collection> _onCollectionEvent(String event) => onJson(
    'collection_$event',
    (json) => fromJson(json, Collection.fromJson),
  );

  Stream<Collection> get onCollectionAdded => _onCollectionEvent('added');

  Stream<Collection> get onCollectionUpdated => _onCollectionEvent('updated');

  Stream<Collection> get onCollectionRemoved => _onCollectionEvent('removed');
}
