// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(taskStart)
final taskStartProvider = TaskStartProvider._();

final class TaskStartProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskStartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskStartProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskStartHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskStart(ref);
  }
}

String _$taskStartHash() => r'bfa65d968d2506bf90af476467c587535e014099';

@ProviderFor(taskUpdate)
final taskUpdateProvider = TaskUpdateProvider._();

final class TaskUpdateProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskUpdateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskUpdateHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskUpdate(ref);
  }
}

String _$taskUpdateHash() => r'9f71cc46384d63fbb609c974ef5a7ac6ee6f0232';

@ProviderFor(taskComplete)
final taskCompleteProvider = TaskCompleteProvider._();

final class TaskCompleteProvider
    extends $FunctionalProvider<AsyncValue<Task>, Task, Stream<Task>>
    with $FutureModifier<Task>, $StreamProvider<Task> {
  TaskCompleteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'taskCompleteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$taskCompleteHash();

  @$internal
  @override
  $StreamProviderElement<Task> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Task> create(Ref ref) {
    return taskComplete(ref);
  }
}

String _$taskCompleteHash() => r'8a8f189efc47c82e11e0f45451eeb7a0963f680c';
