import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storii/api/abs/models/server_settings.dart';
import 'package:storii/api/abs/models/user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
sealed class LoginResponse with _$LoginResponse {
  const factory({
    required User user,
    String? userDefaultLibraryId,
    required ServerSettings serverSettings,
    @JsonKey(name: 'Source') required String source,
  }) = _LoginResponse;

  factory fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
