import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/library_item.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
sealed class Collection with _$Collection {
  @DateTimeEpochConverter()
  const factory({
    required String id,
    required String libraryId,
    required String name,
    String? description,
    required DateTime lastUpdate,
    required DateTime createdAt,
    required List<LibraryItem> books,
  }) = _Collection;

  factory fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}
