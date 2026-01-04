import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Features/categories/data/repos/categories_repo.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoriesRepo _categoriesRepo;

  CategoryProductsCubit(this._categoriesRepo)
    : super(CategoryProductsInitial());

  List<ProductModel> _products = [];
  int _offset = 0;
  final int _limit = 10;
  bool _hasNext = true;
  int? _currentCategoryId;

  Future<void> fetchCategoryProducts({required int categoryId}) async {
    _currentCategoryId = categoryId;
    _products = [];
    _offset = 0;
    _hasNext = true;
    emit(CategoryProductsLoading());
    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: categoryId,
      limit: _limit,
      offset: _offset,
    );

    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.errorMessage)),
      (products) {
        _products = products;
        if (products.length < _limit) {
          _hasNext = false;
        }
        emit(CategoryProductsSuccess(_products));
      },
    );
  }

  Future<void> loadMoreCategoryProducts({int? categoryId}) async {
    final targetCategoryId = categoryId ?? _currentCategoryId;
    if (targetCategoryId == null) return;
    if (state is CategoryProductsPaginationLoading || !_hasNext) return;

    _offset += _limit;
    emit(CategoryProductsPaginationLoading(_products));

    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: targetCategoryId,
      limit: _limit,
      offset: _offset,
    );

    result.fold(
      (failure) {
        _offset -= _limit;
        emit(
          CategoryProductsPaginationFailure(_products, failure.errorMessage),
        );
      },
      (products) {
        if (products.isEmpty) {
          _hasNext = false;
          emit(CategoryProductsSuccess(_products));
        } else {
          _products.addAll(products);
          if (products.length < _limit) {
            _hasNext = false;
          }
          emit(CategoryProductsSuccess(_products));
        }
      },
    );
  }
}
