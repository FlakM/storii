import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/enums.dart';
import 'package:storii/api/abs/models/filter.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/library_item.dart';

part 'library_items_response.freezed.dart';
part 'library_items_response.g.dart';

@freezed
sealed class LibraryItemsResponse with _$LibraryItemsResponse {
  @FilterConverter()
  const factory({
    required List<LibraryItem> results,
    required int total,
    required int limit,
    required int page,
    String? sortBy,
    required bool sortDesc,
    Filter? filterBy,
    required MediaType mediaType,
    required bool minified,
    @JsonKey(name: 'collapseseries') required bool collapseSeries,
    required String include,
  }) = _LibraryItemsResponse;

  factory fromJson(Map<String, dynamic> json) =>
      _$LibraryItemsResponseFromJson(json);
}
