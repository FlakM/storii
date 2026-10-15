import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/providers/repository_providers.dart';
import 'package:storii/features/admin/logic/task_stream_provider.dart';

part 'library_actions_provider.g.dart';

@riverpod
class ScanLibrary extends _$ScanLibrary {
  @override
  Future<Set<String>> build() async {
    ref.listen(taskStartProvider, (_, next) {
      final start = next.value;
      if (start?.data?.libraryId != null) {
        state = AsyncData({...?state.value}..add(start!.data!.libraryId!));
      }
    });

    ref.listen(taskCompleteProvider, (_, next) {
      final complete = next.value;
      if (complete?.data?.libraryId != null) {
        state = AsyncData(
          {...?state.value}..remove(complete!.data!.libraryId!),
        );
      }
    });

    return {};
  }

  Future<void> scan(String libraryId) async {
    final repo = ref.read(libraryRepositoryProvider);

    return repo.scanLibrary(libraryId);
  }
}
