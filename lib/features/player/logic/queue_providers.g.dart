// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QueueNotifier)
final queueProvider = QueueNotifierProvider._();

final class QueueNotifierProvider
    extends $NotifierProvider<QueueNotifier, QueueState> {
  QueueNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueNotifierHash();

  @$internal
  @override
  QueueNotifier create() => QueueNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueState>(value),
    );
  }
}

String _$queueNotifierHash() => r'6d621324f88096e0d8d1b02d4c566c26c6f7a79f';

abstract class _$QueueNotifier extends $Notifier<QueueState> {
  QueueState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<QueueState, QueueState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QueueState, QueueState>,
              QueueState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(queueCount)
final queueCountProvider = QueueCountProvider._();

final class QueueCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  QueueCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return queueCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$queueCountHash() => r'941ec69c92656ecce72410f0e6c2251038f0ea53';

@ProviderFor(queueController)
final queueControllerProvider = QueueControllerProvider._();

final class QueueControllerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  QueueControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueControllerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return queueController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$queueControllerHash() => r'f6b25103c2a7d900c939b67b33dea2e2054272b9';
