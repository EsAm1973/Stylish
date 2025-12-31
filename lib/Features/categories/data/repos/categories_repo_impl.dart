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
  }) async {
    try {
      final String query =
          '''
query {
  products(categoryId: $categoryId) {
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
