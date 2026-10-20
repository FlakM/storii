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
          AsyncValue<UserProgressActions>,
          UserProgressActions,
          FutureOr<UserProgressActions>
        >
    with
        $FutureModifier<UserProgressActions>,
        $FutureProvider<UserProgressActions> {
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
  $FutureProviderElement<UserProgressActions> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserProgressActions> create(Ref ref) {
    return userProgressActions(ref);
  }
}

String _$userProgressActionsHash() =>
    r'2112b7eb2b036ad16e77e360a3c7a25f5535a9f1';
