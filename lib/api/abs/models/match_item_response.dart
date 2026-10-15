import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/library_item.dart';

part 'match_item_response.freezed.dart';
part 'match_item_response.g.dart';

@freezed
sealed class MatchItemResponse with _$MatchItemResponse {
  const factory({required bool updated, required LibraryItem libraryItem}) =
      _MatchItemResponse;

  factory fromJson(Map<String, dynamic> json) =>
      _$MatchItemResponseFromJson(json);
}
