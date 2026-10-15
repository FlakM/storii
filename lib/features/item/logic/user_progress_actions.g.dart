// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_actions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userProgressActions)
final userProgressActionsProvider = UserProgressActionsProvider._();

final class UserProgressActionsProvider
    extends
        $FunctionalProvider<
          UserProgressActions,
          UserProgressActions,
          UserProgressActions
        >
    with $Provider<UserProgressActions> {
  UserProgressActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProgressActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProgressActionsHash();

  @$internal
  @override
  $ProviderElement<UserProgressActions> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserProgressActions create(Ref ref) {
    return userProgressActions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProgressActions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProgressActions>(value),
    );
  }
}

String _$userProgressActionsHash() =>
    r'c29728ba317e20f19a42db575707cbc893cf79bc';
