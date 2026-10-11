import 'package:storii/api/abs/client/api_client.dart';
import 'package:storii/api/abs/endpoints/api_routes.dart';
import 'package:storii/api/abs/models/author.dart';
import 'package:storii/api/abs/models/json_helpers.dart';

class AuthorApi {
  final ApiClient api;
  const new(this.api);

  Future<Author> get(String authorId, String libraryId) async {
    final response = await api.request(
      ApiRoutes.authorById(authorId),
      method: .get,
      query: {'include': 'items,series'},
    );
    return fromJson(response.data, Author.fromJson);
  }
}
