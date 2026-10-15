import 'package:storii/app/logs/log_service.dart';
import 'package:storii/shared/helpers/app_error.dart';

Future<T> logApiCall<T>(
  Future<T> Function() call, {
  required String source,
  String? logMessage,
  bool debug = false,
}) async {
  try {
    return await call();
  } catch (e, st) {
    final error = AppError.from(e, st);
    final message = logMessage != null
        ? '$logMessage: ${error.message}'
        : error.message;
    LogService.log(
      message,
      source: source,
      level: debug ? .debug : .error,
      originalError: error.originalError,
      stackTrace: error.stackTrace,
    );
    throw error;
  }
}

Future<T> callWithAuth<T>(
  Future<void> auth,
  Future<T> Function() call, {
  required String source,
  String? logMessage,
}) async {
  await auth;
  return logApiCall(call, source: source, logMessage: logMessage);
}
