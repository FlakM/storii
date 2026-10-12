// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playlistAdded)
final playlistAddedProvider = PlaylistAddedProvider._();

final class PlaylistAddedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistAddedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistAddedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistAddedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistAdded(ref);
  }
}

String _$playlistAddedHash() => r'3e093edc0d5ee9866ed2a639e70c8570cfbb3a2d';

@ProviderFor(playlistUpdated)
final playlistUpdatedProvider = PlaylistUpdatedProvider._();

final class PlaylistUpdatedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistUpdatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistUpdatedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistUpdatedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistUpdated(ref);
  }
}

String _$playlistUpdatedHash() => r'a4ffcc155b76df044702cb094a4e2e5889fcb208';

@ProviderFor(playlistRemoved)
final playlistRemovedProvider = PlaylistRemovedProvider._();

final class PlaylistRemovedProvider
    extends
        $FunctionalProvider<AsyncValue<Playlist>, Playlist, Stream<Playlist>>
    with $FutureModifier<Playlist>, $StreamProvider<Playlist> {
  PlaylistRemovedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistRemovedProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistRemovedHash();

  @$internal
  @override
  $StreamProviderElement<Playlist> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Playlist> create(Ref ref) {
    return playlistRemoved(ref);
  }
}

String _$playlistRemovedHash() => r'465f666c7ca9c02e270b65b99200965f4f781c5d';
