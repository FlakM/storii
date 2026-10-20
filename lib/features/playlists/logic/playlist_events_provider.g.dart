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

String _$playlistAddedHash() => r'aa8d7861397a0cc08f76325a854ce8cd4f10b5fe';

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

String _$playlistUpdatedHash() => r'e07e46e0feea04cd460339d265630ea5c3c8c4d2';

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

String _$playlistRemovedHash() => r'e62404f01673ac9d04af2699ec987dfec3a76c6f';
