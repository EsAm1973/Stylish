import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_product_item.dart';

class CategoriesProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  const CategoriesProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverMasonryGrid.count(
        crossAxisCount: MediaQuery.of(context).size.width > 900
            ? 4
            : MediaQuery.of(context).size.width > 600
            ? 3
            : 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        itemBuilder: (context, index) {
          // Adjust height for staggered effect if needed,
          // or let it be determined by content if imageHeight is null.
          // Based on the provided image, we can vary heights slightly.
          final isEven = index % 2 == 0;
          return ProductItem(
            product: products[index],
            imageHeight: isEven ? 180.h : 220.h, // Vary heights to match design
            margin: EdgeInsets.zero,
          );
        },
        childCount: products.length,
      ),
    );
  }
}
