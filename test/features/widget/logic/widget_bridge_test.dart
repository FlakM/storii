import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storii/features/widget/logic/widget_bridge.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel(WidgetBridge.channelName);
  final binding = TestDefaultBinaryMessengerBinding.instance;
  final bridge = WidgetBridge();

  final calls = <MethodCall>[];

  setUp(calls.clear);

  tearDown(
    () =>
        binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null),
  );

  void mockChannel(Object? Function(MethodCall call)? handler) {
    binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      call,
    ) async {
      calls.add(call);
      return handler?.call(call);
    });
  }

  test('installedWidgetIds invokes getInstalledWidgets', () async {
    mockChannel((call) => [1, 2]);
    expect(await bridge.installedWidgetIds(), [1, 2]);
    expect(calls.single.method, 'getInstalledWidgets');
  });

  test('readData invokes getWidgetData with the key', () async {
    mockChannel((call) => 'config-json');
    expect(await bridge.readData('widget_1'), 'config-json');
    expect(calls.single.method, 'getWidgetData');
    expect(calls.single.arguments, {'key': 'widget_1'});
  });

  test('readData returns null when native has no value', () async {
    mockChannel((call) => null);
    expect(await bridge.readData('widget_1'), isNull);
  });

  test('saveData invokes saveWidgetData with key and value', () async {
    mockChannel(null);
    await bridge.saveData('widget_1', 'config-json');
    expect(calls.single.method, 'saveWidgetData');
    expect(calls.single.arguments, {'key': 'widget_1', 'value': 'config-json'});
  });

  test('saveData passes null value through for removal', () async {
    mockChannel(null);
    await bridge.saveData('widget_1', null);
    expect(calls.single.arguments, {'key': 'widget_1', 'value': null});
  });

  test('updateWidgetsUI invokes updateWidget', () async {
    mockChannel(null);
    await bridge.updateWidgetsUI();
    expect(calls.single.method, 'updateWidget');
  });

  test('propagates errors without a native handler', () async {
    expect(bridge.installedWidgetIds, throwsA(isA<MissingPluginException>()));
    expect(() => bridge.readData('widget_1'), throwsA(anything));
    expect(calls, isEmpty);
  });
}
