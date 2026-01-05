import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_images.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_info.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_size_selection.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class ProductDetailsViewbody extends StatelessWidget {
  const ProductDetailsViewbody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            const Icon(Icons.shopping_cart_outlined),
            SizedBox(width: 16.w),
          ],
        ),
        SliverToBoxAdapter(child: ProductImagesCarousel(product: product)),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        const SliverToBoxAdapter(child: ProductSizeSelection()),
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        SliverToBoxAdapter(child: ProductInfo(product: product)),
      ],
    );
  }
}
