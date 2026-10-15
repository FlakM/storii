import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/shared/helpers/extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'servers_store.g.dart';

class ServersStore {
  const new();

  Future<void> add(Server server) => serversBox.put(server.id, server);

  Future<void> remove(String id) => serversBox.delete(id);

  List<Server> getAll() => serversBox.values.toList();

  Server? get(Uri url) {
    return serversBox.values.firstWhereOrNull((s) => s.url == url);
  }
}

@riverpod
ServersStore serversStore(Ref ref) => const ServersStore();

@riverpod
Stream<List<Server>> servers(Ref ref) {
  return serversBox
      .watch()
      .map((_) => serversBox.values.toList())
      .startWith(serversBox.values.toList());
}

@riverpod
Stream<Server?> serverStream(Ref ref, Uri url) {
  return serversBox
      .watch()
      .map((_) => serversBox.values.firstWhereOrNull((s) => s.url == url))
      .startWith(serversBox.values.firstWhereOrNull((s) => s.url == url));
}
