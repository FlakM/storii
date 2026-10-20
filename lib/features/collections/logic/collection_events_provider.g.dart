// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(collectionAdded)
final collectionAddedProvider = CollectionAddedProvider._();

final class CollectionAddedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionAddedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionAddedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionAddedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionAdded(ref);
  }
}

String _$collectionAddedHash() => r'5980e0873be5ce12a251449d55b3a2136a96632f';

@ProviderFor(collectionUpdated)
final collectionUpdatedProvider = CollectionUpdatedProvider._();

final class CollectionUpdatedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionUpdatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionUpdatedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionUpdatedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionUpdated(ref);
  }
}

String _$collectionUpdatedHash() => r'2b67594e8c8448286b50cbb8fada50f73e99d6f8';

@ProviderFor(collectionRemoved)
final collectionRemovedProvider = CollectionRemovedProvider._();

final class CollectionRemovedProvider
    extends
        $FunctionalProvider<
          AsyncValue<Collection>,
          Collection,
          Stream<Collection>
        >
    with $FutureModifier<Collection>, $StreamProvider<Collection> {
  CollectionRemovedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionRemovedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionRemovedHash();

  @$internal
  @override
  $StreamProviderElement<Collection> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Collection> create(Ref ref) {
    return collectionRemoved(ref);
  }
}

String _$collectionRemovedHash() => r'52a50855d33e744a45b349989f7b1382c76849bc';
