import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/models/server.dart';
import 'package:storii/app/providers/api_providers.dart';
import 'package:storii/shared/helpers/app_error.dart';

part 'servers_provider.g.dart';

@riverpod
Future<String?> pingServer(Ref ref, Uri url) async {
  try {
    final authApi = ref.read(authApiProvider(url));
    await authApi.healthCheck();
    LogService.log('server is reachable at $url', level: .info);
    return null;
  } catch (e, st) {
    final error = AppError.from(e, st);
    return error.localizedMessage;
  }
}

@Riverpod(keepAlive: true)
class TempServer extends _$TempServer {
  @override
  Server? build() => null;

  void init({Server? server, Uri? url}) {
    state = server ?? Server(id: '', url: url ?? Uri.parse('https://'));
  }

  void setHeaders(Map<String, String> headers) {
    final current = state;
    if (current == null) return;
    state = current.copyWith(headers: headers);
  }
}
