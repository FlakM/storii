import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
sealed class Folder with _$Folder {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String fullPath,
    required String libraryId,
    required DateTime addedAt,
  }) = _Folder;

  factory fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
