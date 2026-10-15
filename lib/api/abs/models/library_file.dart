import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/enums.dart';
import 'package:storii/api/abs/models/file_metadata.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'library_file.freezed.dart';
part 'library_file.g.dart';

@freezed
sealed class LibraryFile with _$LibraryFile {
  @DateTimeEpochConverter()
  const factory({
    required String ino,
    required FileMetadata metadata,
    required DateTime addedAt,
    required DateTime updatedAt,
    required FileType fileType,
  }) = _LibraryFile;

  factory fromJson(Map<String, dynamic> json) => _$LibraryFileFromJson(json);
}
