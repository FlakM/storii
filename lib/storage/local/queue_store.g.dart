// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(queueStore)
final queueStoreProvider = QueueStoreProvider._();

final class QueueStoreProvider
    extends $FunctionalProvider<QueueStore, QueueStore, QueueStore>
    with $Provider<QueueStore> {
  QueueStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueStoreHash();

  @$internal
  @override
  $ProviderElement<QueueStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QueueStore create(Ref ref) {
    return queueStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueStore>(value),
    );
  }
}

String _$queueStoreHash() => r'db737aa3be7acca8e6024a5332b7689f3d00e858';
