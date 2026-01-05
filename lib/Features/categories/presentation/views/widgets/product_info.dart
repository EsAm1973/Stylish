import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_colors.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({
    super.key,
    this.description =
        "Perhaps the most iconic sneaker of all-time, this original \"Chicago\" colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the return of the classic high-top silhouette, premium materials, and that undeniable red, black, and white palette that defined an era of basketball and street culture. Whether you're a hardcore collector or a casual enthusiast, the Air Jordan 1 Chicago remains a ultimate must-have.",
  });

  final String description;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  bool _isExpanded = false;
  final int _truncateLimit = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nike Sneakers", style: AppTextStyles.bold21),
          SizedBox(height: 8.h),
          Text(
            "Vision Alta Men’s Shoes Size (All Colours)",
            style: AppTextStyles.regular14,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              ...List.generate(
                4,
                (index) =>
                    const Icon(Icons.star, color: Color(0xFFEDB310), size: 20),
              ),
              const Icon(Icons.star_half, color: Color(0xFFEDB310), size: 20),
              SizedBox(width: 8.w),
              Text("56,890", style: AppTextStyles.regular12),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                "₹2,999",
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.textGrey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "₹1,500",
                style: AppTextStyles.bold14.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "50% Off",
                style: AppTextStyles.semiBold14.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Product Details",
            style: AppTextStyles.bold14.copyWith(color: AppColors.onBackground),
          ),
          SizedBox(height: 8.h),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.onSurface,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                          (_isExpanded ||
                              widget.description.length <= _truncateLimit)
                          ? widget.description
                          : "${widget.description.substring(0, _truncateLimit)}... ",
                    ),
                    if (widget.description.length > _truncateLimit)
                      TextSpan(
                        text: _isExpanded ? " Less" : "More",
                        style: AppTextStyles.semiBold12.copyWith(
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
