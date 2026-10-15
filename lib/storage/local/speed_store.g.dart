// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(speedStore)
final speedStoreProvider = SpeedStoreProvider._();

final class SpeedStoreProvider
    extends $FunctionalProvider<SpeedStore, SpeedStore, SpeedStore>
    with $Provider<SpeedStore> {
  SpeedStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'speedStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$speedStoreHash();

  @$internal
  @override
  $ProviderElement<SpeedStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SpeedStore create(Ref ref) {
    return speedStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SpeedStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SpeedStore>(value),
    );
  }
}

String _$speedStoreHash() => r'6eaf72c0e0127a25438d9d6c523ffda37d27eda0';
