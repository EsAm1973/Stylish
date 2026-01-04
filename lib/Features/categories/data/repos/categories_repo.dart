import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts({
    required int categoryId,
    int limit = 10,
    int offset = 0,
    String? title,
  });
}
