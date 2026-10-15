import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/storage/hive/boxes.dart';

part 'speed_store.g.dart';

class SpeedStore {
  const new();

  double? getSpeed(String libraryItemId) => speedsBox.get(libraryItemId);

  Future<void> saveSpeed(String libraryItemId, double speed) async {
    await speedsBox.put(libraryItemId, speed);
  }

  Future<void> clear() async {
    await speedsBox.clear();
  }
}

@riverpod
SpeedStore speedStore(Ref ref) => const SpeedStore();
