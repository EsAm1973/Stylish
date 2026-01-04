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

  // Search related state
  String? _searchTerm;
  List<ProductModel> _searchProducts = [];
  int _searchOffset = 0;
  bool _searchHasNext = true;

  Future<void> fetchCategoryProducts({required int categoryId}) async {
    _currentCategoryId = categoryId;
    _products = [];
    _offset = 0;
    _hasNext = true;
    _searchTerm = null; // Reset search when switching categories
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

  Future<void> searchCategoryProducts(String title) async {
    if (_currentCategoryId == null) return;

    if (title.isEmpty) {
      _searchTerm = null;
      emit(CategoryProductsSuccess(_products));
      return;
    }

    _searchTerm = title;
    _searchProducts = [];
    _searchOffset = 0;
    _searchHasNext = true;

    emit(
      CategoryProductsLoading(),
    ); // Or a separate search loading state if preferred
    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: _currentCategoryId!,
      limit: _limit,
      offset: _searchOffset,
      title: title,
    );

    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.errorMessage)),
      (products) {
        _searchProducts = products;
        if (products.length < _limit) {
          _searchHasNext = false;
        }
        emit(CategoryProductsSuccess(_searchProducts));
      },
    );
  }

  Future<void> loadMoreCategoryProducts({int? categoryId}) async {
    final targetCategoryId = categoryId ?? _currentCategoryId;
    if (targetCategoryId == null) return;

    if (_searchTerm != null) {
      await _loadMoreSearchResults(targetCategoryId);
    } else {
      await _loadMoreMainResults(targetCategoryId);
    }
  }

  Future<void> _loadMoreMainResults(int categoryId) async {
    if (state is CategoryProductsPaginationLoading || !_hasNext) return;

    _offset += _limit;
    emit(CategoryProductsPaginationLoading(_products));

    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: categoryId,
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

  Future<void> _loadMoreSearchResults(int categoryId) async {
    if (state is CategoryProductsPaginationLoading || !_searchHasNext) return;

    _searchOffset += _limit;
    emit(CategoryProductsPaginationLoading(_searchProducts));

    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: categoryId,
      limit: _limit,
      offset: _searchOffset,
      title: _searchTerm,
    );

    result.fold(
      (failure) {
        _searchOffset -= _limit;
        emit(
          CategoryProductsPaginationFailure(
            _searchProducts,
            failure.errorMessage,
          ),
        );
      },
      (products) {
        if (products.isEmpty) {
          _searchHasNext = false;
          emit(CategoryProductsSuccess(_searchProducts));
        } else {
          _searchProducts.addAll(products);
          if (products.length < _limit) {
            _searchHasNext = false;
          }
          emit(CategoryProductsSuccess(_searchProducts));
        }
      },
    );
  }
}
