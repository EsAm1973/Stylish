import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Core/utils/app_endpoints.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiService _apiService;

  // Default placeholder avatar URL
  static const String _defaultAvatarUrl = 'https://i.pravatar.cc/150?img=1';

  AuthRepoImplementation(this._apiService);

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
        AppEndpoints.createUser,
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
}
