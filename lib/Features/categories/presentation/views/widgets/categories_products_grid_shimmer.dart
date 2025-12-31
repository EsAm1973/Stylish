import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish/Features/home/presentation/views/widgets/product_item_shimmer.dart';

class CategoriesProductsGridShimmer extends StatelessWidget {
  const CategoriesProductsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        itemBuilder: (context, index) {
          final isEven = index % 2 == 0;
          return ProductItemShimmer(
            height: isEven ? 180.h : 220.h,
            margin: EdgeInsets.zero,
          );
        },
        childCount: 6,
      ),
    );
  }
}
