import 'package:get_it/get_it.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Core/services/secure_storage_service.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo_implementation.dart';

final getit = GetIt.instance;

void setupGetIt() {
  getit.registerSingleton<ApiService>(ApiService());

  getit.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  getit.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(
      getit<ApiService>(),
      getit<SecureStorageService>(),
    ),
  );
}
