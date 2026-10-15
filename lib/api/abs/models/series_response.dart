import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/filter.dart';
import 'package:storii/api/abs/models/json_converters.dart';
import 'package:storii/api/abs/models/series.dart';

part 'series_response.freezed.dart';
part 'series_response.g.dart';

@freezed
sealed class SeriesResponse with _$SeriesResponse {
  @FilterConverter()
  const factory({
    required List<Series> results,
    required int total,
    required int limit,
    required int page,
    String? sortBy,
    required bool sortDesc,
    Filter? filterBy,
    required bool minified,
    required String include,
  }) = _SeriesResponse;

  factory fromJson(Map<String, dynamic> json) => _$SeriesResponseFromJson(json);
}
