import 'package:stylish/Core/errors/failure.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductModel> products;
  final bool hasReachedMax;

  ProductsSuccess({required this.products, this.hasReachedMax = false});
}

class ProductsFailure extends ProductsState {
  final Failure failure;

  ProductsFailure({required this.failure});
}
