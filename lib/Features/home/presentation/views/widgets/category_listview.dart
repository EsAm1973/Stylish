import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';
import 'package:stylish/Features/home/presentation/views/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(name: 'Beauty', imageUrl: 'assets/images/category_test.png'),
    CategoryModel(name: 'Fashion', imageUrl: 'assets/images/category_test.png'),
    CategoryModel(name: 'Kids', imageUrl: 'assets/images/category_test.png'),
    CategoryModel(name: 'Mens', imageUrl: 'assets/images/category_test.png'),
    CategoryModel(name: 'Womens', imageUrl: 'assets/images/category_test.png'),
  ];

  @override
  Widget build(BuildContext context) {
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
}
