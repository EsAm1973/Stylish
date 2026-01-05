import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_images.dart';

class ProductDetailsViewbody extends StatelessWidget {
  const ProductDetailsViewbody({super.key});

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
        const SliverToBoxAdapter(
          child: Column(children: [ProductImagesCarousel()]),
        ),
      ],
    );
  }
}
