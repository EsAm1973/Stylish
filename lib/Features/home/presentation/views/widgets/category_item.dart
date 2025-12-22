import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular Image
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(category.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(category.name, style: AppTextStyles.regular10),
        ],
      ),
    );
  }
}
