import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'widget_bridge.g.dart';

class WidgetBridge {
  new() : _channel = const MethodChannel(WidgetBridge.channelName);

  static const channelName = 'com.likhithpraveenk.storii/widget';

  final MethodChannel _channel;

  Future<List<int>> installedWidgetIds() async {
    return await _channel.invokeListMethod<int>('getInstalledWidgets') ??
        const [];
  }

  Future<String?> readData(String key) async {
    return await _channel.invokeMethod<String>('getWidgetData', {'key': key});
  }

  Future<void> saveData(String key, String? value) async {
    await _channel.invokeMethod('saveWidgetData', {'key': key, 'value': value});
  }

  Future<void> updateWidgetsUI() async {
    await _channel.invokeMethod('updateWidget');
  }

  Future<String?> pendingPlay() async {
    return await _channel.invokeMethod<String>('getPendingPlay');
  }

  Future<void> clearPendingPlay() async {
    await _channel.invokeMethod('clearPendingPlay');
  }

  void setPendingPlayListener(Future<void> Function() onQueued) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'pendingPlayQueued') await onQueued();
      return null;
    });
  }

  void clearPendingPlayListener() {
    _channel.setMethodCallHandler(null);
  }
}

@riverpod
WidgetBridge widgetBridge(Ref ref) => WidgetBridge();
