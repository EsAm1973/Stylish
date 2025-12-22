import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

class DealOfTheDayBanner extends StatelessWidget {
  const DealOfTheDayBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF4392F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Deal of the Day",
                style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Icon(Icons.access_time_outlined, color: Colors.white),
                  SizedBox(width: 6.w),
                  Text(
                    "22h 55m 20s remaining",
                    style: AppTextStyles.regular12.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Right Side: View All Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.white, width: 1.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            ),
            child: Row(
              children: [
                Text(
                  "View all",
                  style: AppTextStyles.semiBold12.copyWith(color: Colors.white),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.arrow_forward, color: Colors.white, size: 14.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
