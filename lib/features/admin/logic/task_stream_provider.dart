import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/providers/api_providers.dart';

part 'task_stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Task> taskStart(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.taskEvents.onTaskStart;
}

@Riverpod(keepAlive: true)
Stream<Task> taskUpdate(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.taskEvents.onTaskUpdate;
}

@Riverpod(keepAlive: true)
Stream<Task> taskComplete(Ref ref) async* {
  final socket = await ref.watch(socketApiProvider.future);
  yield* socket.taskEvents.onTaskComplete;
}
