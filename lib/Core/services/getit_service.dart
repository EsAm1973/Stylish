import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Features/auth/data/datasource/secure_storage_service.dart';
import 'package:stylish/Features/auth/data/datasource/token_refresh_interceptor.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo_implementation.dart';
import 'package:stylish/Core/repos/profile/profile_repo.dart';
import 'package:stylish/Core/repos/profile/profile_repo_impl.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';
import 'package:stylish/Features/home/data/repos/home_repo_impl.dart';

final getit = GetIt.instance;

void setupGetIt() {
  // 1. Core Services & Storage
  getit.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  getit.registerLazySingleton<TokenStorage<TokensPair>>(
    () => TokenStorageImpl(getit<FlutterSecureStorage>()),
  );

  // 2. Authentication (Fresh)
  getit.registerLazySingleton<Fresh<TokensPair>>(
    () => TokenRefreshInterceptor(getit<TokenStorage<TokensPair>>()).fresh,
  );

  // 3. Network (Dio)
  getit.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.escuelajs.co/api/v1/',
        headers: {'Content-Type': 'application/json'},
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    // Add Fresh interceptor for token handling
    dio.interceptors.add(getit<Fresh<TokensPair>>());

    // Add LogInterceptor for debugging (optional but good practice)
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  });

  // 4. API Service
  getit.registerSingleton<ApiService>(ApiService(dio: getit<Dio>()));

  // 5. Repositories
  getit.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(
      getit<ApiService>(),
      getit<Fresh<TokensPair>>(), // Inject Fresh to save tokens
    ),
  );

  getit.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(getit<ApiService>()),
  );
  getit.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(getit<ApiService>()),
  );
}
