import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

class ProductActionsBar extends StatelessWidget {
  const ProductActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: _ActionButton(
              text: "Go to cart",
              icon: Icons.shopping_cart_outlined,
              gradient: LinearGradient(
                colors: [Color(0xFF3F92FF), Color(0xFF0B3689)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              circleColor: Color(0xFF2E73D4),
            ),
          ),
          SizedBox(width: 16.w),
          const Expanded(
            child: _ActionButton(
              text: "Buy Now",
              icon: Icons.touch_app_outlined,
              gradient: LinearGradient(
                colors: [Color(0xFF71F395), Color(0xFF31B769)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              circleColor: Color(0xFF5CD682),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.text,
    required this.icon,
    required this.gradient,
    required this.circleColor,
  });

  final String text;
  final IconData icon;
  final Gradient gradient;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 4.w,
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 24.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Text(
              text,
              style: AppTextStyles.bold16.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
