import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Core/services/api_service.dart';

import 'package:stylish/Core/utils/app_endpoints.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService _apiService;
  final Fresh<TokensPair> _fresh;

  // Default placeholder avatar URL
  static const String _defaultAvatarUrl = 'https://i.pravatar.cc/150?img=1';

  AuthRepoImplementation(this._apiService, this._fresh);

  @override
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String name,
    required String email,
    required String password,
    String? avatar,
  }) async {
    try {
      final avatarUrl = avatar ?? _defaultAvatarUrl;
      final registrationData = {
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatarUrl,
      };

      final response = await _apiService.post(
        AppEndpoints.register,
        registrationData,
      );

      return Right(response as Map<String, dynamic>);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: 'An unexpected error occurred: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final loginData = {'email': email, 'password': password};

      final response = await _apiService.post(AppEndpoints.login, loginData);

      final responseMap = response as Map<String, dynamic>;

      // Save tokens
      final tokens = TokensPair.fromJson(responseMap);
      await _fresh.setToken(tokens);

      return Right(responseMap);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(
        ServerFailure(
          errorMessage: 'An unexpected error occurred: ${e.toString()}',
        ),
      );
    }
  }
}
