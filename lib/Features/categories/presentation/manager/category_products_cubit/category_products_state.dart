import 'package:stylish/Features/home/data/models/product_model.dart';

abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsLoading extends CategoryProductsState {}

class CategoryProductsSuccess extends CategoryProductsState {
  final List<ProductModel> products;

  CategoryProductsSuccess(this.products);
}

class CategoryProductsFailure extends CategoryProductsState {
  final String errorMessage;

  CategoryProductsFailure(this.errorMessage);
}

class CategoryProductsPaginationLoading extends CategoryProductsState {
  final List<ProductModel> products;

  CategoryProductsPaginationLoading(this.products);
}

class CategoryProductsPaginationFailure extends CategoryProductsState {
  final List<ProductModel> products;
  final String errorMessage;

  CategoryProductsPaginationFailure(this.products, this.errorMessage);
}
