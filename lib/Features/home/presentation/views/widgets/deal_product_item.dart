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
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
            child: imageHeight != null
                ? _buildImage(imageHeight!)
                : AspectRatio(
                    aspectRatio: 1.3,
                    child: _buildImage(double.infinity),
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
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
                SizedBox(height: 2.h),
                // Description
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular10,
                ),
                SizedBox(height: 6.h),
                // Price Row
                Wrap(
                  spacing: 4.w,
                  runSpacing: 2.h,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('₹${product.price}', style: AppTextStyles.semiBold12),
                    if (product.originalPrice != null)
                      Text(
                        '₹${product.originalPrice}',
                        style: AppTextStyles.regular10.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                    if (product.discount != null)
                      Text(
                        product.discount!,
                        style: AppTextStyles.regular10.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 6.h),
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
                            size: 14.r,
                          );
                        } else if (index + 0.5 == product.rating) {
                          return Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 14.r,
                          );
                        } else {
                          return Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 14.r,
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

  Widget _buildImage(double height) {
    if (product.imageUrl.isEmpty) {
      return Container(
        height: height == double.infinity ? null : height,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Icon(Icons.image, size: 40.r, color: Colors.grey),
      );
    }
    if (product.imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: product.imageUrl,
        height: height == double.infinity ? null : height,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) =>
            Icon(Icons.image, size: 40.r, color: Colors.grey),
      );
    }
    return Image.asset(
      product.imageUrl,
      height: height == double.infinity ? null : height,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
