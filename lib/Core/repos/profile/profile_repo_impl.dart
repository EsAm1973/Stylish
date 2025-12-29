import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/user_model.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Core/utils/app_endpoints.dart';
import 'package:stylish/Core/repos/profile/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService _apiService;

  ProfileRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserModel>> fetchUserProfile() async {
    try {
      final response = await _apiService.get(AppEndpoints.profile);

      return Right(UserModel.fromJson(response));
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
