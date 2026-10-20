import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/features/player/logic/queue_providers.dart';
import 'package:storii/features/widget/logic/widget_bridge.dart';

part 'widget_play_controller.g.dart';

@riverpod
void widgetPlayController(Ref ref) {
  final bridge = ref.read(widgetBridgeProvider);
  var consuming = false;

  Future<void> consume() async {
    if (consuming) return;
    consuming = true;
    try {
      final raw = await bridge.pendingPlay();
      if (raw == null || raw.isEmpty) return;
      await bridge.clearPendingPlay();

      final parts = raw.split(':');
      final itemId = parts[0];
      final episodeId = parts[1] == 'null' ? null : parts[1];

      await ref
          .read(queueProvider.notifier)
          .play(itemId: itemId, episodeId: episodeId);
    } catch (e, st) {
      LogService.log(
        'Failed to consume widget play request',
        originalError: e,
        stackTrace: st,
        source: 'WidgetPlayController',
      );
    } finally {
      consuming = false;
    }
  }

  bridge.setPendingPlayListener(consume);
  ref.onDispose(bridge.clearPendingPlayListener);

  Future.microtask(consume);
}
