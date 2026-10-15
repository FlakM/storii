// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_history_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playbackHistoryStore)
final playbackHistoryStoreProvider = PlaybackHistoryStoreProvider._();

final class PlaybackHistoryStoreProvider
    extends
        $FunctionalProvider<
          PlaybackHistoryStore,
          PlaybackHistoryStore,
          PlaybackHistoryStore
        >
    with $Provider<PlaybackHistoryStore> {
  PlaybackHistoryStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playbackHistoryStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playbackHistoryStoreHash();

  @$internal
  @override
  $ProviderElement<PlaybackHistoryStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PlaybackHistoryStore create(Ref ref) {
    return playbackHistoryStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaybackHistoryStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaybackHistoryStore>(value),
    );
  }
}

String _$playbackHistoryStoreHash() =>
    r'2e19d693e4d94c404fba4d4f9763509c1bb64d0f';
