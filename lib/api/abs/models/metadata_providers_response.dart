import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/metadata_provider.dart';

part 'metadata_providers_response.freezed.dart';
part 'metadata_providers_response.g.dart';

@freezed
sealed class MetadataProvidersResponse with _$MetadataProvidersResponse {
  const factory({
    @Default([]) List<MetadataProvider> books,
    @Default([]) List<MetadataProvider> booksCovers,
    @Default([]) List<MetadataProvider> podcasts,
  }) = _MetadataProvidersResponse;

  factory fromJson(Map<String, dynamic> json) =>
      _$MetadataProvidersResponseFromJson(json);
}
