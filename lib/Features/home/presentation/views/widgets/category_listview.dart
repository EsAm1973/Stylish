import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';
import 'package:stylish/Features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/categories_cubit/categories_state.dart';
import 'package:stylish/Features/home/presentation/views/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return _buildCategoriesList(state.categories);
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.failure.errorMessage));
        } else {
          return Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            child: _buildCategoriesList(_dummyCategories),
          );
        }
      },
    );
  }

  Widget _buildCategoriesList(List<CategoryModel> categories) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }

  static final List<CategoryModel> _dummyCategories = List.generate(
    5,
    (index) => CategoryModel(
      id: index,
      name: 'Category $index',
      slug: 'slug-$index',
      image: 'https://placehold.co/600x400',
    ),
  );
}
