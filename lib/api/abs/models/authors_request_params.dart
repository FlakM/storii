import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/filter.dart';
import 'package:storii/api/abs/models/json_converters.dart';

part 'authors_request_params.freezed.dart';
part 'authors_request_params.g.dart';

@freezed
abstract class AuthorsRequestParams with _$AuthorsRequestParams {
  const new _();

  const factory({
    String? sort,
    @BoolBinaryConverter() bool? desc,
    @FilterConverter() Filter? filter,
  }) = _AuthorsRequestParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$AuthorsRequestParamsFromJson(json);
}
