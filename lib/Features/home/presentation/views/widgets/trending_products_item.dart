import 'package:cached_network_image/cached_network_image.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1.3, // Maintain a consistent look across screens
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
              child: product.imageUrl.isEmpty
                  ? Container(
                      color: Colors.grey.shade200,
                      child: Icon(Icons.image, size: 40.r, color: Colors.grey),
                    )
                  : product.imageUrl.startsWith('http')
                  ? CachedNetworkImage(
                      imageUrl: product.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.image, size: 40.r, color: Colors.grey),
                    )
                  : Image.asset(product.imageUrl, fit: BoxFit.cover),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
