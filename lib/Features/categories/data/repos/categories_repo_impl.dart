import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Core/utils/app_endpoints.dart';
import 'package:stylish/Features/categories/data/repos/categories_repo.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final ApiService _apiService;

  CategoriesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts({
    required int categoryId,
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final response = await _apiService.get(
        AppEndpoints.products,
        queryParameters: {
          'categoryId': categoryId,
          'limit': limit,
          'offset': offset,
        },
      );

      List<ProductModel> products = [];
      for (var item in response) {
        products.add(ProductModel.fromJson(item));
      }

      return Right(products);
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
