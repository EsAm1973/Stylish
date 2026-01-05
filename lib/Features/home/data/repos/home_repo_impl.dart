import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Core/services/api_service.dart';
import 'package:stylish/Core/utils/app_endpoints.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchCategories() async {
    try {
      final response = await _apiService.get(AppEndpoints.categories);

      List<CategoryModel> categories = [];
      for (var item in response) {
        categories.add(CategoryModel.fromJson(item));
      }

      return Right(categories);
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
  Future<Either<Failure, List<ProductModel>>> fetchProducts({
    int limit = 5,
    int offset = 0,
    String? title,
  }) async {
    try {
      final response = await _apiService.get(
        AppEndpoints.products,
        queryParameters: {
          'offset': offset,
          'limit': limit,
          if (title != null) 'title': title,
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
