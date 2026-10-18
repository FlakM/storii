// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_progress_map_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mediaProgressSyncController)
final mediaProgressSyncControllerProvider =
    MediaProgressSyncControllerProvider._();

final class MediaProgressSyncControllerProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  MediaProgressSyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressSyncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressSyncControllerHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return mediaProgressSyncController(ref);
  }
}

String _$mediaProgressSyncControllerHash() =>
    r'4f068cc162edd9a20df3d6e2a6d76267e70af041';

@ProviderFor(_progressUpdate)
final _progressUpdateProvider = _ProgressUpdateProvider._();

final class _ProgressUpdateProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaProgress>,
          MediaProgress,
          Stream<MediaProgress>
        >
    with $FutureModifier<MediaProgress>, $StreamProvider<MediaProgress> {
  _ProgressUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_progressUpdateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_progressUpdateHash();

  @$internal
  @override
  $StreamProviderElement<MediaProgress> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<MediaProgress> create(Ref ref) {
    return _progressUpdate(ref);
  }
}

String _$_progressUpdateHash() => r'a8954a4fcea71479262868f91d502c231aba5f65';

@ProviderFor(mediaProgressMap)
final mediaProgressMapProvider = MediaProgressMapProvider._();

final class MediaProgressMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, MediaProgress>>,
          Map<String, MediaProgress>,
          FutureOr<Map<String, MediaProgress>>
        >
    with
        $FutureModifier<Map<String, MediaProgress>>,
        $FutureProvider<Map<String, MediaProgress>> {
  MediaProgressMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaProgressMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressMapHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, MediaProgress>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, MediaProgress>> create(Ref ref) {
    return mediaProgressMap(ref);
  }
}

String _$mediaProgressMapHash() => r'98c7e3179ae0418c51e8bd22294577b21124b58f';

@ProviderFor(totalFinishedBooks)
final totalFinishedBooksProvider = TotalFinishedBooksProvider._();

final class TotalFinishedBooksProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TotalFinishedBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalFinishedBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalFinishedBooksHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalFinishedBooks(ref);
  }
}

String _$totalFinishedBooksHash() =>
    r'b477eec071d2bf4456f3aa1a09775df871d6934c';

@ProviderFor(totalFinishedEpisodes)
final totalFinishedEpisodesProvider = TotalFinishedEpisodesProvider._();

final class TotalFinishedEpisodesProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  TotalFinishedEpisodesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalFinishedEpisodesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalFinishedEpisodesHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalFinishedEpisodes(ref);
  }
}

String _$totalFinishedEpisodesHash() =>
    r'121b41f5c82d4c6245dfa18fddcb4871ddca494f';

@ProviderFor(mediaProgressFromMap)
final mediaProgressFromMapProvider = MediaProgressFromMapFamily._();

final class MediaProgressFromMapProvider
    extends
        $FunctionalProvider<
          AsyncValue<MediaProgress?>,
          MediaProgress?,
          FutureOr<MediaProgress?>
        >
    with $FutureModifier<MediaProgress?>, $FutureProvider<MediaProgress?> {
  MediaProgressFromMapProvider._({
    required MediaProgressFromMapFamily super.from,
    required (String, String?) super.argument,
  }) : super(
         retry: null,
         name: r'mediaProgressFromMapProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mediaProgressFromMapHash();

  @override
  String toString() {
    return r'mediaProgressFromMapProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<MediaProgress?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<MediaProgress?> create(Ref ref) {
    final argument = this.argument as (String, String?);
    return mediaProgressFromMap(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is MediaProgressFromMapProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mediaProgressFromMapHash() =>
    r'99d4c227709889fbc6c9a4ece45c1ceb0d3f6f0f';

final class MediaProgressFromMapFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<MediaProgress?>, (String, String?)> {
  MediaProgressFromMapFamily._()
    : super(
        retry: null,
        name: r'mediaProgressFromMapProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MediaProgressFromMapProvider call(
    String libraryItemId, [
    String? episodeId,
  ]) => MediaProgressFromMapProvider._(
    argument: (libraryItemId, episodeId),
    from: this,
  );

  @override
  String toString() => r'mediaProgressFromMapProvider';
}
