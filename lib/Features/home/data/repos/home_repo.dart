import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
  Future<Either<Failure, List<ProductModel>>> fetchProducts({
    int limit = 5,
    int offset = 0,
  });
}
