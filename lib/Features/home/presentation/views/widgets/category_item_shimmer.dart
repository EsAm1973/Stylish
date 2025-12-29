import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_shimmer.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomShimmer.circular(width: 60.w, height: 60.w),
          SizedBox(height: 8.h),
          CustomShimmer.rectangular(width: 40.w, height: 10.h),
        ],
      ),
    );
  }
}
