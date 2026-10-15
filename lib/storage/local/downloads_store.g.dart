// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(downloadsStore)
final downloadsStoreProvider = DownloadsStoreProvider._();

final class DownloadsStoreProvider
    extends $FunctionalProvider<DownloadsStore, DownloadsStore, DownloadsStore>
    with $Provider<DownloadsStore> {
  DownloadsStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsStoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsStoreHash();

  @$internal
  @override
  $ProviderElement<DownloadsStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DownloadsStore create(Ref ref) {
    return downloadsStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadsStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadsStore>(value),
    );
  }
}

String _$downloadsStoreHash() => r'bbad505dc26a49547cfd5b5f38d4b3af8059cba0';

@ProviderFor(Downloads)
final downloadsProvider = DownloadsProvider._();

final class DownloadsProvider
    extends $StreamNotifierProvider<Downloads, Map<String, DownloadItem>> {
  DownloadsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'downloadsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$downloadsHash();

  @$internal
  @override
  Downloads create() => Downloads();
}

String _$downloadsHash() => r'a1440a5b101109197b0bafd873c1735b06975556';

abstract class _$Downloads extends $StreamNotifier<Map<String, DownloadItem>> {
  Stream<Map<String, DownloadItem>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, DownloadItem>>,
              Map<String, DownloadItem>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, DownloadItem>>,
                Map<String, DownloadItem>
              >,
              AsyncValue<Map<String, DownloadItem>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
