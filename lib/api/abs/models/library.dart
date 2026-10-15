import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/enums.dart';
import 'package:storii/api/abs/models/folder.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'library.freezed.dart';
part 'library.g.dart';

@freezed
sealed class Library with _$Library {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String name,
    required List<Folder> folders,
    required int displayOrder,
    String? icon,
    required MediaType mediaType,
    String? provider,
    required DateTime createdAt,
    required DateTime lastUpdate,
  }) = _Library;

  factory fromJson(Map<String, dynamic> json) => _$LibraryFromJson(json);
}
