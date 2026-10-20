// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(libraryRepository)
final libraryRepositoryProvider = LibraryRepositoryFamily._();

final class LibraryRepositoryProvider
    extends
        $FunctionalProvider<
          LibraryRepository,
          LibraryRepository,
          LibraryRepository
        >
    with $Provider<LibraryRepository> {
  LibraryRepositoryProvider._({
    required LibraryRepositoryFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'libraryRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$libraryRepositoryHash();

  @override
  String toString() {
    return r'libraryRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LibraryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LibraryRepository create(Ref ref) {
    final argument = this.argument as UserDomain;
    return libraryRepository(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LibraryRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$libraryRepositoryHash() => r'84d318337113cfc2619765eb599cc15055130667';

final class LibraryRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<LibraryRepository, UserDomain> {
  LibraryRepositoryFamily._()
    : super(
        retry: null,
        name: r'libraryRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LibraryRepositoryProvider call(UserDomain user) =>
      LibraryRepositoryProvider._(argument: user, from: this);

  @override
  String toString() => r'libraryRepositoryProvider';
}

@ProviderFor(itemRepository)
final itemRepositoryProvider = ItemRepositoryFamily._();

final class ItemRepositoryProvider
    extends $FunctionalProvider<ItemRepository, ItemRepository, ItemRepository>
    with $Provider<ItemRepository> {
  ItemRepositoryProvider._({
    required ItemRepositoryFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'itemRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemRepositoryHash();

  @override
  String toString() {
    return r'itemRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ItemRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemRepository create(Ref ref) {
    final argument = this.argument as UserDomain;
    return itemRepository(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemRepositoryHash() => r'ee75656765df6ba650f968a63dc00fc38cc52a87';

final class ItemRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<ItemRepository, UserDomain> {
  ItemRepositoryFamily._()
    : super(
        retry: null,
        name: r'itemRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemRepositoryProvider call(UserDomain user) =>
      ItemRepositoryProvider._(argument: user, from: this);

  @override
  String toString() => r'itemRepositoryProvider';
}

@ProviderFor(meRepository)
final meRepositoryProvider = MeRepositoryFamily._();

final class MeRepositoryProvider
    extends $FunctionalProvider<MeRepository, MeRepository, MeRepository>
    with $Provider<MeRepository> {
  MeRepositoryProvider._({
    required MeRepositoryFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'meRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$meRepositoryHash();

  @override
  String toString() {
    return r'meRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeRepository create(Ref ref) {
    final argument = this.argument as UserDomain;
    return meRepository(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MeRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$meRepositoryHash() => r'3f8134848ec4f46f70774bdb8cfeb45ae5d4c784';

final class MeRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<MeRepository, UserDomain> {
  MeRepositoryFamily._()
    : super(
        retry: null,
        name: r'meRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MeRepositoryProvider call(UserDomain user) =>
      MeRepositoryProvider._(argument: user, from: this);

  @override
  String toString() => r'meRepositoryProvider';
}

@ProviderFor(sessionRepository)
final sessionRepositoryProvider = SessionRepositoryFamily._();

final class SessionRepositoryProvider
    extends
        $FunctionalProvider<
          SessionRepository,
          SessionRepository,
          SessionRepository
        >
    with $Provider<SessionRepository> {
  SessionRepositoryProvider._({
    required SessionRepositoryFamily super.from,
    required UserDomain super.argument,
  }) : super(
         retry: null,
         name: r'sessionRepositoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionRepositoryHash();

  @override
  String toString() {
    return r'sessionRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SessionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SessionRepository create(Ref ref) {
    final argument = this.argument as UserDomain;
    return sessionRepository(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionRepository>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionRepositoryHash() => r'1867b6d44da65a2d36d9bb411684cb42790bda57';

final class SessionRepositoryFamily extends $Family
    with $FunctionalFamilyOverride<SessionRepository, UserDomain> {
  SessionRepositoryFamily._()
    : super(
        retry: null,
        name: r'sessionRepositoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionRepositoryProvider call(UserDomain user) =>
      SessionRepositoryProvider._(argument: user, from: this);

  @override
  String toString() => r'sessionRepositoryProvider';
}
