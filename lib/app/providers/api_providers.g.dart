// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiCancelToken)
final apiCancelTokenProvider = ApiCancelTokenProvider._();

final class ApiCancelTokenProvider
    extends $FunctionalProvider<CancelToken, CancelToken, CancelToken>
    with $Provider<CancelToken> {
  ApiCancelTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiCancelTokenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiCancelTokenHash();

  @$internal
  @override
  $ProviderElement<CancelToken> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CancelToken create(Ref ref) {
    return apiCancelToken(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CancelToken value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CancelToken>(value),
    );
  }
}

String _$apiCancelTokenHash() => r'dd8913a44ddd2c64f9c7e658d852c00dc8c13101';

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

final class ApiClientProvider
    extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClient>(value),
    );
  }
}

String _$apiClientHash() => r'3c0dd473dc9a98c4e5ff6bacf2d0e651a9ae2a21';

@ProviderFor(authApi)
final authApiProvider = AuthApiFamily._();

final class AuthApiProvider
    extends $FunctionalProvider<AuthApi, AuthApi, AuthApi>
    with $Provider<AuthApi> {
  AuthApiProvider._({
    required AuthApiFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'authApiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$authApiHash();

  @override
  String toString() {
    return r'authApiProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AuthApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthApi create(Ref ref) {
    final argument = this.argument as Uri;
    return authApi(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthApi>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuthApiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$authApiHash() => r'3c39aa76e0f3262e7722072c448787f1b8be7b1f';

final class AuthApiFamily extends $Family
    with $FunctionalFamilyOverride<AuthApi, Uri> {
  AuthApiFamily._()
    : super(
        retry: null,
        name: r'authApiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AuthApiProvider call(Uri baseUrl) =>
      AuthApiProvider._(argument: baseUrl, from: this);

  @override
  String toString() => r'authApiProvider';
}

@ProviderFor(serverApi)
final serverApiProvider = ServerApiProvider._();

final class ServerApiProvider
    extends $FunctionalProvider<ServerApi, ServerApi, ServerApi>
    with $Provider<ServerApi> {
  ServerApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverApiHash();

  @$internal
  @override
  $ProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerApi create(Ref ref) {
    return serverApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerApi>(value),
    );
  }
}

String _$serverApiHash() => r'cb4d1be05bc49c770c1637f161fbdf46fa7f6446';

@ProviderFor(libraryApi)
final libraryApiProvider = LibraryApiProvider._();

final class LibraryApiProvider
    extends $FunctionalProvider<LibraryApi, LibraryApi, LibraryApi>
    with $Provider<LibraryApi> {
  LibraryApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryApiHash();

  @$internal
  @override
  $ProviderElement<LibraryApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LibraryApi create(Ref ref) {
    return libraryApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LibraryApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LibraryApi>(value),
    );
  }
}

String _$libraryApiHash() => r'c19315e0bd043d321c3a97d842c7f402875d7f80';

@ProviderFor(itemApi)
final itemApiProvider = ItemApiProvider._();

final class ItemApiProvider
    extends $FunctionalProvider<ItemApi, ItemApi, ItemApi>
    with $Provider<ItemApi> {
  ItemApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemApiHash();

  @$internal
  @override
  $ProviderElement<ItemApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemApi create(Ref ref) {
    return itemApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemApi>(value),
    );
  }
}

String _$itemApiHash() => r'cae7ca796de5a8a1c262e7c0511e5f9f731b9e86';

@ProviderFor(meApi)
final meApiProvider = MeApiProvider._();

final class MeApiProvider extends $FunctionalProvider<MeApi, MeApi, MeApi>
    with $Provider<MeApi> {
  MeApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meApiHash();

  @$internal
  @override
  $ProviderElement<MeApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeApi create(Ref ref) {
    return meApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeApi>(value),
    );
  }
}

String _$meApiHash() => r'a36080ae9cab89803fe3f658d71602155b4d23f3';

@ProviderFor(sessionsApi)
final sessionsApiProvider = SessionsApiProvider._();

final class SessionsApiProvider
    extends $FunctionalProvider<SessionsApi, SessionsApi, SessionsApi>
    with $Provider<SessionsApi> {
  SessionsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionsApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionsApiHash();

  @$internal
  @override
  $ProviderElement<SessionsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionsApi create(Ref ref) {
    return sessionsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionsApi>(value),
    );
  }
}

String _$sessionsApiHash() => r'f035ab5e98c1f49a2de822e8274ee5749adc9c3f';

@ProviderFor(socketApi)
final socketApiProvider = SocketApiProvider._();

final class SocketApiProvider
    extends
        $FunctionalProvider<
          AsyncValue<SocketApi>,
          SocketApi,
          FutureOr<SocketApi>
        >
    with $FutureModifier<SocketApi>, $FutureProvider<SocketApi> {
  SocketApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socketApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socketApiHash();

  @$internal
  @override
  $FutureProviderElement<SocketApi> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SocketApi> create(Ref ref) {
    return socketApi(ref);
  }
}

String _$socketApiHash() => r'df43540a109e24d44b3f628656c6ec8fe4be6c70';

@ProviderFor(collectionsApi)
final collectionsApiProvider = CollectionsApiProvider._();

final class CollectionsApiProvider
    extends $FunctionalProvider<CollectionsApi, CollectionsApi, CollectionsApi>
    with $Provider<CollectionsApi> {
  CollectionsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsApiHash();

  @$internal
  @override
  $ProviderElement<CollectionsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CollectionsApi create(Ref ref) {
    return collectionsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionsApi>(value),
    );
  }
}

String _$collectionsApiHash() => r'15a51061dfe2582844d548180160febc97f5264e';

@ProviderFor(playlistsApi)
final playlistsApiProvider = PlaylistsApiProvider._();

final class PlaylistsApiProvider
    extends $FunctionalProvider<PlaylistsApi, PlaylistsApi, PlaylistsApi>
    with $Provider<PlaylistsApi> {
  PlaylistsApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playlistsApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playlistsApiHash();

  @$internal
  @override
  $ProviderElement<PlaylistsApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaylistsApi create(Ref ref) {
    return playlistsApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaylistsApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaylistsApi>(value),
    );
  }
}

String _$playlistsApiHash() => r'a71df6bef0d284403f9857d1edf35da4d4c3f95f';

@ProviderFor(searchApi)
final searchApiProvider = SearchApiProvider._();

final class SearchApiProvider
    extends $FunctionalProvider<SearchApi, SearchApi, SearchApi>
    with $Provider<SearchApi> {
  SearchApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchApiHash();

  @$internal
  @override
  $ProviderElement<SearchApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SearchApi create(Ref ref) {
    return searchApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchApi>(value),
    );
  }
}

String _$searchApiHash() => r'5debfa1af67573698a719db72d52eff1234ee7eb';
