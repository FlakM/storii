import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/downloads/models/download_item.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'downloads_store.g.dart';

DownloadItem? _decode(String? value) {
  if (value == null) return null;
  try {
    return DownloadItem.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode download item: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'DownloadsStore',
    );
    return null;
  }
}

class DownloadsStore {
  const new();

  Future<void> save(DownloadItem item) async {
    await downloadsBox.put(item.key, jsonEncode(item));
  }

  Future<void> remove(String id) => downloadsBox.delete(id);

  DownloadItem? get(String mediaItemIdKey) =>
      _decode(downloadsBox.get(mediaItemIdKey));

  Map<String, DownloadItem> getAll() => Map.fromEntries(
    downloadsBox.values
        .map(_decode)
        .whereType<DownloadItem>()
        .map((item) => MapEntry(item.key, item)),
  );

  Future<void> removeAllFromLocation(String uri) async {
    final keys = getAll().values
        .where((i) => i.folderPath == uri)
        .map((d) => d.key);
    await downloadsBox.deleteAll(keys);
  }

  Future<void> clear() => downloadsBox.clear();
}

@riverpod
DownloadsStore downloadsStore(Ref ref) => const DownloadsStore();

@riverpod
class Downloads extends _$Downloads {
  @override
  Stream<Map<String, DownloadItem>> build() {
    final initial = ref.read(downloadsStoreProvider).getAll();
    return downloadsBox
        .watch()
        .map((e) {
          final items = Map<String, DownloadItem>.from(state.value ?? {});
          if (e.deleted) {
            items.remove(e.key);
          } else {
            final item = _decode(e.value as String?);
            if (item != null) {
              items[item.key] = item;
            } else {
              items.remove(e.key);
            }
          }
          return items;
        })
        .startWith(initial);
  }
}
