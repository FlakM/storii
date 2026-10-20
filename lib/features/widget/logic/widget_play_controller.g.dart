// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_play_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(widgetPlayController)
final widgetPlayControllerProvider = WidgetPlayControllerProvider._();

final class WidgetPlayControllerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  WidgetPlayControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'widgetPlayControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$widgetPlayControllerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return widgetPlayController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$widgetPlayControllerHash() =>
    r'7544c0223156e7f3d15fd5cc649b69a4d292c612';
