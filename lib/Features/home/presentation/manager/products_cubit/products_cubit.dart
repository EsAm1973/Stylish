import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo _homeRepo;
  int _offset = 0;
  final int _limit = 5;
  bool _isFetching = false;

  // Search related state
  String? _searchTerm;
  int _searchOffset = 0;
  List<ProductModel> _mainProducts = [];
  bool _mainHasReachedMax = false;
  List<ProductModel> _searchProducts = [];
  bool _searchHasReachedMax = false;

  bool get isSearchActive => _searchTerm != null;

  ProductsCubit(this._homeRepo) : super(ProductsInitial());

  Future<void> fetchProducts({bool isFirstTime = false}) async {
    if (_searchTerm != null) {
      await _fetchSearchProducts(isFirstTime: isFirstTime);
    } else {
      await _fetchMainProducts(isFirstTime: isFirstTime);
    }
  }

  Future<void> _fetchMainProducts({bool isFirstTime = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    if (isFirstTime) {
      _offset = 0;
      emit(ProductsLoading());
    }

    final result = await _homeRepo.fetchProducts(
      limit: _limit,
      offset: _offset,
    );

    result.fold(
      (failure) {
        emit(ProductsFailure(failure: failure));
        _isFetching = false;
      },
      (products) {
        if (isFirstTime) {
          _mainProducts = products;
          _mainHasReachedMax = products.length < _limit;
          emit(
            ProductsSuccess(
              products: _mainProducts,
              hasReachedMax: _mainHasReachedMax,
            ),
          );
        } else {
          _mainProducts.addAll(products);
          _mainHasReachedMax = products.length < _limit;
          emit(
            ProductsSuccess(
              products: _mainProducts,
              hasReachedMax: _mainHasReachedMax,
            ),
          );
        }
        _offset += _limit;
        _isFetching = false;
      },
    );
  }

  Future<void> searchProducts(String title) async {
    if (title.isEmpty) {
      _searchTerm = null;
      emit(
        ProductsSuccess(
          products: _mainProducts,
          hasReachedMax: _mainHasReachedMax,
        ),
      );
      return;
    }

    _searchTerm = title;
    _searchOffset = 0;
    _searchProducts = [];
    _searchHasReachedMax = false;

    await _fetchSearchProducts(isFirstTime: true);
  }

  Future<void> _fetchSearchProducts({bool isFirstTime = false}) async {
    if (_isFetching) return;
    _isFetching = true;

    if (isFirstTime) {
      _searchOffset = 0;
      emit(ProductsLoading());
    }

    final result = await _homeRepo.fetchProducts(
      limit: _limit,
      offset: _searchOffset,
      title: _searchTerm,
    );

    result.fold(
      (failure) {
        emit(ProductsFailure(failure: failure));
        _isFetching = false;
      },
      (products) {
        if (isFirstTime) {
          _searchProducts = products;
          _searchHasReachedMax = products.length < _limit;
          emit(
            ProductsSuccess(
              products: _searchProducts,
              hasReachedMax: _searchHasReachedMax,
            ),
          );
        } else {
          _searchProducts.addAll(products);
          _searchHasReachedMax = products.length < _limit;
          emit(
            ProductsSuccess(
              products: _searchProducts,
              hasReachedMax: _searchHasReachedMax,
            ),
          );
        }
        _searchOffset += _limit;
        _isFetching = false;
      },
    );
  }
}
