import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:storii/api/abs/abs_api.dart';
import 'package:storii/app/logs/log_service.dart';
import 'package:storii/app/logs/logs_interceptor.dart';
import 'package:storii/app/network/offline_cache_interceptor.dart';
import 'package:storii/app/providers/connection_providers.dart';
import 'package:storii/app/providers/settings_provider.dart';
import 'package:storii/app/providers/token_provider.dart';
import 'package:storii/features/auth/logic/servers_provider.dart';
import 'package:storii/features/auth/logic/user_session_controller.dart';
import 'package:storii/storage/hive/boxes.dart';
import 'package:storii/storage/local/servers_store.dart';

part 'api_providers.g.dart';

@Riverpod(keepAlive: true)
CancelToken apiCancelToken(Ref ref) {
  ref.watch(currentUserProvider);
  final cancelToken = CancelToken();
  ref.onDispose(() {
    cancelToken.cancel('User session disposed or logged out');
  });
  return cancelToken;
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final tokenService = ref.watch(tokenProvider);
  final cancelToken = ref.watch(apiCancelTokenProvider);
  final serverUrl = ref.watch(activeServerUrlProvider);

  final cacheOptions = CacheOptions(
    store: networkCacheStore,
    policy: .refreshForceCache,
    hitCacheOnNetworkFailure: true,
    maxStale: const Duration(days: 7),
  );

  final headers = ref.read(serversStoreProvider).get(user.serverUrl)?.headers;

  final apiClient = ApiClient(
    baseUrl: serverUrl,
    cancelToken: cancelToken,
    headers: headers,
    interceptors: [
      LogsInterceptor(),
      OfflineCacheInterceptor(
        isConnected: () => ref.read(serverConnectionProvider),
        cacheOptions: cacheOptions,
      ),
      DioCacheInterceptor(options: cacheOptions),
    ],
    getAccessToken: () async {
      final token = await tokenService.getAccessToken(user.id);
      return token;
    },
    getRefreshToken: () async {
      final token = await tokenService.getRefreshToken(user.id);
      return token;
    },
    onTokensUpdated: (newAccess, newRefresh) async {
      await tokenService.saveTokens(user.id, newAccess, newRefresh);
    },
    onTokensFailure: () async {
      await ref
          .read(userSessionControllerProvider.notifier)
          .forceLogout(user, reason: 'Token refresh failed');
    },
  );

  return apiClient;
}

@riverpod
AuthApi authApi(Ref ref, Uri baseUrl) {
  final headers = ref.read(tempServerProvider)?.headers;
  return AuthApi(
    BaseApiClient(
      baseUrl: baseUrl,
      headers: headers,
      interceptors: [LogsInterceptor()],
    ),
  );
}

@riverpod
ServerApi serverApi(Ref ref) => ServerApi(ref.watch(apiClientProvider));

@riverpod
LibraryApi libraryApi(Ref ref) => LibraryApi(ref.watch(apiClientProvider));

@riverpod
ItemApi itemApi(Ref ref) => ItemApi(ref.watch(apiClientProvider));

@riverpod
MeApi meApi(Ref ref) => MeApi(ref.watch(apiClientProvider));

@riverpod
SessionsApi sessionsApi(Ref ref) => SessionsApi(ref.watch(apiClientProvider));

@Riverpod(keepAlive: true)
Future<SocketApi> socketApi(Ref ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) throw StateError('No current user');

  final tokenService = ref.read(tokenProvider);
  final token = await tokenService.getAccessToken(user.id);
  final serverUrl = ref.watch(activeServerUrlProvider);

  final api = SocketApi(
    baseUrl: serverUrl.toString(),
    token: token,
    tokenUpdates: tokenService.tokenStream(user.id),
    onAuthFailure: () {
      LogService.log('Socket authentication failed');
    },
  );
  ref.onDispose(api.dispose);
  return api;
}

@riverpod
CollectionsApi collectionsApi(Ref ref) =>
    CollectionsApi(ref.watch(apiClientProvider));

@riverpod
PlaylistsApi playlistsApi(Ref ref) =>
    PlaylistsApi(ref.watch(apiClientProvider));

@riverpod
SearchApi searchApi(Ref ref) => SearchApi(ref.watch(apiClientProvider));
