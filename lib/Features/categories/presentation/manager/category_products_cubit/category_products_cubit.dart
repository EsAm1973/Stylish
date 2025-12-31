import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/categories/data/repos/categories_repo.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoriesRepo _categoriesRepo;

  CategoryProductsCubit(this._categoriesRepo)
    : super(CategoryProductsInitial());

  Future<void> fetchCategoryProducts({required int categoryId}) async {
    emit(CategoryProductsLoading());
    var result = await _categoriesRepo.fetchCategoryProducts(
      categoryId: categoryId,
    );

    result.fold(
      (failure) => emit(CategoryProductsFailure(failure.errorMessage)),
      (products) => emit(CategoryProductsSuccess(products)),
    );
  }
}
