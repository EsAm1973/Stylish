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
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final String query =
          '''
query {
  products(limit: $limit, offset: $offset) {
    id
    title
    price
    description
    images
    category {
      id
      name
      image
    }
  }
}
''';
      final response = await _apiService.post(AppEndpoints.graphql, {
        'query': query,
      });

      List<ProductModel> products = [];
      if (response['data'] != null && response['data']['products'] != null) {
        for (var item in response['data']['products']) {
          products.add(ProductModel.fromJson(item));
        }
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
