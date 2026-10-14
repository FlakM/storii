import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/shared/helpers/abs_model_extensions.dart';

part 'item_actions_provider.g.dart';

@Riverpod(keepAlive: true)
class ScanItem extends _$ScanItem {
  @override
  Future<Set<String>> build() async => {};

  Future<String?> scan(String itemId) async {
    try {
      final repo = ref.read(itemRepositoryProvider);
      state = AsyncData({...?state.value, itemId});
      final result = await repo.scanItem(itemId);
      return result?.label;
    } finally {
      state = AsyncData({...?state.value}..remove(itemId));
    }
  }
}
