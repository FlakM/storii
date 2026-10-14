// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(widgetStore)
final widgetStoreProvider = WidgetStoreProvider._();

final class WidgetStoreProvider
    extends $FunctionalProvider<WidgetStore, WidgetStore, WidgetStore>
    with $Provider<WidgetStore> {
  WidgetStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetStoreHash();

  @$internal
  @override
  $ProviderElement<WidgetStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WidgetStore create(Ref ref) {
    return widgetStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WidgetStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WidgetStore>(value),
    );
  }
}

String _$widgetStoreHash() => r'2e745ce4bb5cbd48d29dadf89a4cf290dc659ca7';
