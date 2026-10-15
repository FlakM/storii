import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'items_cache.g.dart';

class ItemsCache {
  const new();

  Future<void> put(LibraryItem item) async {
    await itemsBox.put(item.id, jsonEncode(item));
  }

  LibraryItem? get(String id) {
    final json = itemsBox.get(id);
    if (json == null) return null;
    return LibraryItem.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> delete(String id) => itemsBox.delete(id);
}

@riverpod
ItemsCache itemsCache(Ref ref) => const ItemsCache();
