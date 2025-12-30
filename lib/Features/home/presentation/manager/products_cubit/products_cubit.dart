import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo _homeRepo;
  int _offset = 0;
  final int _limit = 5;
  bool _isFetching = false;

  ProductsCubit(this._homeRepo) : super(ProductsInitial());

  Future<void> fetchProducts({bool isFirstTime = false}) async {
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
          emit(
            ProductsSuccess(
              products: products,
              hasReachedMax: products.length < _limit,
            ),
          );
        } else {
          final currentState = state;
          if (currentState is ProductsSuccess) {
            emit(
              ProductsSuccess(
                products: currentState.products + products,
                hasReachedMax: products.length < _limit,
              ),
            );
          }
        }
        _offset += _limit;
        _isFetching = false;
      },
    );
  }
}
