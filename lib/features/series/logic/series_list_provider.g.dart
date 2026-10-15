// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SeriesListNotifier)
final seriesListProvider = SeriesListNotifierProvider._();

final class SeriesListNotifierProvider
    extends $AsyncNotifierProvider<SeriesListNotifier, PaginatedSeriesItems> {
  SeriesListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'seriesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$seriesListNotifierHash();

  @$internal
  @override
  SeriesListNotifier create() => SeriesListNotifier();
}

String _$seriesListNotifierHash() =>
    r'8eabc65fa129d946a5d96a086552dd5e9b2591dd';

abstract class _$SeriesListNotifier
    extends $AsyncNotifier<PaginatedSeriesItems> {
  FutureOr<PaginatedSeriesItems> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<PaginatedSeriesItems>, PaginatedSeriesItems>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedSeriesItems>,
                PaginatedSeriesItems
              >,
              AsyncValue<PaginatedSeriesItems>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
