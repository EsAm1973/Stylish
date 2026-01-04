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

  // Filter related state
  String? _searchTerm;
  num? _price;
  num? _priceMin;
  num? _priceMax;

  List<ProductModel> _filteredProducts = [];
  int _filteredOffset = 0;
  bool _filteredHasNext = true;

  Future<void> fetchCategoryProducts({required int categoryId}) async {
    _currentCategoryId = categoryId;
    _products = [];
    _offset = 0;
    _hasNext = true;
    _searchTerm = null; // Reset filters when switching categories
    _price = null;
    _priceMin = null;
    _priceMax = null;
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

  Future<void> applyFilters({
    String? title,
    num? price,
    num? priceMin,
    num? priceMax,
  }) async {
    if (_currentCategoryId == null) return;

    _searchTerm = title;
    _price = price;
    _priceMin = priceMin;
    _priceMax = priceMax;

    _filteredProducts = [];
    _filteredOffset = 0;
    _filteredHasNext = true;

    emit(CategoryProductsLoading());

    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: _currentCategoryId!,
      limit: _limit,
      offset: _filteredOffset,
      title: _searchTerm,
      price: _price,
      priceMin: _priceMin,
      priceMax: _priceMax,
    );

    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.errorMessage)),
      (products) {
        _filteredProducts = products;
        if (products.length < _limit) {
          _filteredHasNext = false;
        }
        emit(CategoryProductsSuccess(_filteredProducts));
      },
    );
  }

  Future<void> resetFilters() async {
    if (_currentCategoryId == null) return;
    _searchTerm = null;
    _price = null;
    _priceMin = null;
    _priceMax = null;
    await fetchCategoryProducts(categoryId: _currentCategoryId!);
  }

  Future<void> searchCategoryProducts(String title) async {
    await applyFilters(
      title: title.isEmpty ? null : title,
      price: _price,
      priceMin: _priceMin,
      priceMax: _priceMax,
    );
  }

  Future<void> loadMoreCategoryProducts({int? categoryId}) async {
    final targetCategoryId = categoryId ?? _currentCategoryId;
    if (targetCategoryId == null) return;

    if (_searchTerm != null ||
        _price != null ||
        _priceMin != null ||
        _priceMax != null) {
      await _loadMoreFilteredResults(targetCategoryId);
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

  Future<void> _loadMoreFilteredResults(int categoryId) async {
    if (state is CategoryProductsPaginationLoading || !_filteredHasNext) return;

    _filteredOffset += _limit;
    emit(CategoryProductsPaginationLoading(_filteredProducts));

    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: categoryId,
      limit: _limit,
      offset: _filteredOffset,
      title: _searchTerm,
      price: _price,
      priceMin: _priceMin,
      priceMax: _priceMax,
    );

    result.fold(
      (failure) {
        _filteredOffset -= _limit;
        emit(
          CategoryProductsPaginationFailure(
            _filteredProducts,
            failure.errorMessage,
          ),
        );
      },
      (products) {
        if (products.isEmpty) {
          _filteredHasNext = false;
          emit(CategoryProductsSuccess(_filteredProducts));
        } else {
          _filteredProducts.addAll(products);
          if (products.length < _limit) {
            _filteredHasNext = false;
          }
          emit(CategoryProductsSuccess(_filteredProducts));
        }
      },
    );
  }
}
