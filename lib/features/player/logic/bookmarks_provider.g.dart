// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bookmarks)
final bookmarksProvider = BookmarksFamily._();

final class BookmarksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bookmark>>,
          List<Bookmark>,
          FutureOr<List<Bookmark>>
        >
    with $FutureModifier<List<Bookmark>>, $FutureProvider<List<Bookmark>> {
  BookmarksProvider._({
    required BookmarksFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookmarksProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookmarksHash();

  @override
  String toString() {
    return r'bookmarksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Bookmark>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Bookmark>> create(Ref ref) {
    final argument = this.argument as String;
    return bookmarks(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookmarksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookmarksHash() => r'db56fc310c6f94e3929694692936269f63ec917a';

final class BookmarksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Bookmark>>, String> {
  BookmarksFamily._()
    : super(
        retry: null,
        name: r'bookmarksProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookmarksProvider call(String itemId) =>
      BookmarksProvider._(argument: itemId, from: this);

  @override
  String toString() => r'bookmarksProvider';
}

@ProviderFor(bookmarksController)
final bookmarksControllerProvider = BookmarksControllerProvider._();

final class BookmarksControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<BookmarksController>,
          BookmarksController,
          FutureOr<BookmarksController>
        >
    with
        $FutureModifier<BookmarksController>,
        $FutureProvider<BookmarksController> {
  BookmarksControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarksControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarksControllerHash();

  @$internal
  @override
  $FutureProviderElement<BookmarksController> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BookmarksController> create(Ref ref) {
    return bookmarksController(ref);
  }
}

String _$bookmarksControllerHash() =>
    r'7fdbb1c55255cc3cadd6e243e2b9bbda75c34dc5';
