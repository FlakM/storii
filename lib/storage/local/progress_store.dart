import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'progress_store.g.dart';

MediaProgress? _decode(String? value) {
  if (value == null) return null;
  try {
    return MediaProgress.fromJson(jsonDecode(value));
  } catch (e, st) {
    LogService.log(
      'failed to decode media progress: $value',
      level: .error,
      originalError: e,
      stackTrace: st,
      source: 'ProgressStore',
    );
    return null;
  }
}

String? _splitKey(dynamic key, String userId) {
  if (key is! String) return null;
  final index = key.indexOf(':');
  if (index == -1) return null;
  final keyUserId = key.substring(0, index);
  if (keyUserId != userId) return null;
  return key.substring(index + 1);
}

class ProgressStore {
  const new({required this.userId});

  final String userId;

  String _key(String id, String? episodeId) =>
      '$userId:${mediaItemIdKey(id, episodeId)}';

  Map<String, MediaProgress> getAll() {
    final entries = userMediaProgressBox.toMap().entries;
    final items = <String, MediaProgress>{};
    for (final entry in entries) {
      final mapKey = _splitKey(entry.key, userId);
      if (mapKey == null) continue;
      final item = _decode(entry.value);
      if (item != null) {
        items[mediaItemIdKey(item.libraryItemId, item.episodeId)] = item;
      }
    }
    return items;
  }

  void put(MediaProgress progress) {
    userMediaProgressBox.put(
      _key(progress.libraryItemId, progress.episodeId),
      jsonEncode(progress),
    );
  }

  void putAll(List<MediaProgress> list) {
    final keysToDelete = userMediaProgressBox.keys
        .where((k) => _splitKey(k, userId) != null)
        .toList();

    final entries = <String, String>{
      for (final p in list) _key(p.libraryItemId, p.episodeId): jsonEncode(p),
    };

    try {
      userMediaProgressBox
        ..deleteAll(keysToDelete)
        ..putAll(entries);
    } catch (e) {
      LogService.log(
        'Failed to sync media progress',
        originalError: e,
        level: .error,
      );
    }
  }
}

@riverpod
ProgressStore progressStore(Ref ref, String userId) =>
    ProgressStore(userId: userId);

@riverpod
class ProgressMap extends _$ProgressMap {
  @override
  Stream<Map<String, MediaProgress>> build(String userId) {
    final initial = ref.read(progressStoreProvider(userId)).getAll();
    return userMediaProgressBox
        .watch()
        .map((e) {
          final mapKey = _splitKey(e.key, userId);
          if (mapKey == null) return state.value ?? <String, MediaProgress>{};

          final map = Map<String, MediaProgress>.from(state.value ?? {});
          if (e.deleted) {
            map.remove(mapKey);
          } else {
            final progress = _decode(e.value as String?);
            if (progress != null) {
              map[mediaItemIdKey(progress.libraryItemId, progress.episodeId)] =
                  progress;
            } else {
              map.remove(mapKey);
            }
          }
          return map;
        })
        .startWith(initial);
  }
}
