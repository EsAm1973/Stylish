import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';
import 'package:stylish/Features/home/presentation/manager/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo) : super(CategoriesInitial());

  final HomeRepo _homeRepo;

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    final result = await _homeRepo.fetchCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(failure)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
