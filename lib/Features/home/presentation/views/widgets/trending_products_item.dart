import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class TrendingProductItem extends StatelessWidget {
  final ProductModel product;

  const TrendingProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 16.0.w, bottom: 8.0.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
            child: Image.asset(
              product.imageUrl,
              height: 130.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semiBold12,
                ),
                SizedBox(height: 4.h),
                // Description
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular10,
                ),
                SizedBox(height: 8.h),
                // Price Row
                Wrap(
                  children: [
                    Text('₹${product.price}', style: AppTextStyles.semiBold12),
                    const SizedBox(width: 8),
                    Text(
                      '₹${product.originalPrice}',
                      style: AppTextStyles.regular10.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      product.discount,
                      style: AppTextStyles.regular10.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                // Rating Row
              ],
            ),
          ),
        ],
      ),
    );
  }
}
