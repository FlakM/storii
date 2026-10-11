import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/metadata_provider.dart';

part 'match_item_request_params.freezed.dart';
part 'match_item_request_params.g.dart';

@freezed
sealed class MatchItemRequestParams with _$MatchItemRequestParams {
  const factory({
    required MetadataProvider provider,
    String? title,
    String? author,
    @Default(false) bool overrideDefaults,
    String? isbn,
    String? asin,
  }) = _MatchItemRequestParams;

  factory fromJson(Map<String, dynamic> json) =>
      _$MatchItemRequestParamsFromJson(json);
}
