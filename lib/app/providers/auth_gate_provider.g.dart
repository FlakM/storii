// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_gate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authGate)
final authGateProvider = AuthGateProvider._();

final class AuthGateProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AuthGateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authGateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authGateHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return authGate(ref);
  }
}

String _$authGateHash() => r'33409c8ad31ca4b5e29e28a85fed1cd442dc9944';

@ProviderFor(AuthRefresher)
final authRefresherProvider = AuthRefresherProvider._();

final class AuthRefresherProvider
    extends $NotifierProvider<AuthRefresher, void> {
  AuthRefresherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRefresherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRefresherHash();

  @$internal
  @override
  AuthRefresher create() => AuthRefresher();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$authRefresherHash() => r'6683bd52786cffbb186eb790a9bbbb41d1fdaba4';

abstract class _$AuthRefresher extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
