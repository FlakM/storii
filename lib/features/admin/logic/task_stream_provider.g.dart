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

String _$taskStartHash() => r'22abf6ee4b1a9d1b01f9f2e73ab995bf728c44f5';

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

String _$taskUpdateHash() => r'd6acdb8787daa7f7067f4f397f1c84605310a7ca';

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

String _$taskCompleteHash() => r'8266f58f51dc5564cce90311fff3882f81e998a5';
