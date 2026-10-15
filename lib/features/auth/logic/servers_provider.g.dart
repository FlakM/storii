// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pingServer)
final pingServerProvider = PingServerFamily._();

final class PingServerProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  PingServerProvider._({
    required PingServerFamily super.from,
    required Uri super.argument,
  }) : super(
         retry: null,
         name: r'pingServerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pingServerHash();

  @override
  String toString() {
    return r'pingServerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as Uri;
    return pingServer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PingServerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pingServerHash() => r'42e33648f8603b4aefe4071cb24d4183ee06150a';

final class PingServerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, Uri> {
  PingServerFamily._()
    : super(
        retry: null,
        name: r'pingServerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PingServerProvider call(Uri url) =>
      PingServerProvider._(argument: url, from: this);

  @override
  String toString() => r'pingServerProvider';
}

@ProviderFor(TempServer)
final tempServerProvider = TempServerProvider._();

final class TempServerProvider extends $NotifierProvider<TempServer, Server?> {
  TempServerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tempServerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tempServerHash();

  @$internal
  @override
  TempServer create() => TempServer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Server? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Server?>(value),
    );
  }
}

String _$tempServerHash() => r'2bf03820d6ed6fa1cb28c702354a2742c359ac2e';

abstract class _$TempServer extends $Notifier<Server?> {
  Server? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Server?, Server?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Server?, Server?>,
              Server?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
