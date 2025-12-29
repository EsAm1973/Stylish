import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_shimmer.dart';

class TrendingProductItemShimmer extends StatelessWidget {
  const TrendingProductItemShimmer({super.key});

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
          CustomShimmer.rectangular(
            height: 130.h,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer.rectangular(height: 12.h, width: 100.w),
                SizedBox(height: 8.h),
                CustomShimmer.rectangular(height: 10.h, width: 140.w),
                SizedBox(height: 4.h),
                CustomShimmer.rectangular(height: 10.h, width: 120.w),
                SizedBox(height: 8.h),
                CustomShimmer.rectangular(height: 12.h, width: 80.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
