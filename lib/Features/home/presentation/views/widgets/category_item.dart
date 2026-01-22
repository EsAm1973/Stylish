import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_colors.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular Image with Border
            Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: .2),
                  width: 1,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: category.image,
                imageBuilder: (context, imageProvider) => Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey4.withValues(alpha: .1),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey4.withValues(alpha: .1),
                  ),
                  child: const Icon(Icons.error_outline),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              category.name,
              style: AppTextStyles.regular10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
