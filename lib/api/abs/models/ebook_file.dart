import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/file_metadata.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'ebook_file.freezed.dart';
part 'ebook_file.g.dart';

@freezed
sealed class EBookFile with _$EBookFile {
  @DateTimeEpochConverter()
  const factory({
    required String ino,
    required FileMetadata metadata,
    required String ebookFormat,
    required DateTime addedAt,
    required DateTime updatedAt,
  }) = _EBookFile;

  factory fromJson(Map<String, dynamic> json) => _$EBookFileFromJson(json);
}
