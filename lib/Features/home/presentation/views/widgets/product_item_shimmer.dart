import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_shimmer.dart';

class ProductItemShimmer extends StatelessWidget {
  final double? height;
  final EdgeInsetsGeometry? margin;

  const ProductItemShimmer({super.key, this.height, this.margin});

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
          AspectRatio(
            aspectRatio: 1.3,
            child: CustomShimmer.rectangular(
              height: double.infinity,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.0.r),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer.rectangular(height: 12.h, width: 100.w),
                SizedBox(height: 4.h),
                CustomShimmer.rectangular(height: 10.h, width: 150.w),
                SizedBox(height: 4.h),
                CustomShimmer.rectangular(height: 10.h, width: 130.w),
                SizedBox(height: 8.h),
                CustomShimmer.rectangular(height: 12.h, width: 60.w),
                SizedBox(height: 8.h),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 2.w),
                      child: CustomShimmer.circular(width: 14.r, height: 14.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
