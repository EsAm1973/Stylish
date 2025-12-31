import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final double? imageHeight;
  final EdgeInsetsGeometry? margin;

  const ProductItem({
    super.key,
    required this.product,
    this.imageHeight,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? EdgeInsets.only(right: 16.0.w, bottom: 8.0.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
            child: product.imageUrl.isEmpty
                ? Container(
                    height: imageHeight ?? 130.h,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Icon(Icons.image, size: 50.r, color: Colors.grey),
                  )
                : product.imageUrl.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    height: imageHeight ?? 130.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: imageHeight ?? 130.h,
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.image, size: 50.r, color: Colors.grey),
                  )
                : Image.asset(
                    product.imageUrl,
                    height: imageHeight ?? 130.h,
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
                    if (product.originalPrice != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '₹${product.originalPrice}',
                        style: AppTextStyles.regular10.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                    if (product.discount != null) ...[
                      SizedBox(width: 8.w),
                      Text(
                        product.discount!,
                        style: AppTextStyles.regular10.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 8.h),
                // Rating Row
                if (product.rating != null)
                  Row(
                    children: [
                      // Generate stars based on rating
                      ...List.generate(5, (index) {
                        if (index < product.rating!.floor()) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.r,
                          );
                        } else if (index + 0.5 == product.rating) {
                          return Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 16.r,
                          );
                        } else {
                          return Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 16.r,
                          );
                        }
                      }),
                      SizedBox(width: 4.w),
                      if (product.reviewCount != null)
                        Text(
                          product.reviewCount.toString(),
                          style: AppTextStyles.regular10.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
