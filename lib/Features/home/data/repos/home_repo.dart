import 'package:dartz/dartz.dart';
import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
}
