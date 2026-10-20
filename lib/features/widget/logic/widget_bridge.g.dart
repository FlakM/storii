// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_bridge.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(widgetBridge)
final widgetBridgeProvider = WidgetBridgeProvider._();

final class WidgetBridgeProvider
    extends $FunctionalProvider<WidgetBridge, WidgetBridge, WidgetBridge>
    with $Provider<WidgetBridge> {
  WidgetBridgeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetBridgeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetBridgeHash();

  @$internal
  @override
  $ProviderElement<WidgetBridge> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WidgetBridge create(Ref ref) {
    return widgetBridge(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetBridge value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetBridge>(value),
    );
  }
}

String _$widgetBridgeHash() => r'82aab667921f1d5971ef0358bb045b400e03aa87';
