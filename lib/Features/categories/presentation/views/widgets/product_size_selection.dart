import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_colors.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

class ProductSizeSelection extends StatefulWidget {
  const ProductSizeSelection({super.key});

  @override
  State<ProductSizeSelection> createState() => _ProductSizeSelectionState();
}

class _ProductSizeSelectionState extends State<ProductSizeSelection> {
  String _selectedSize = "7 UK";
  final List<String> _sizes = ["6 UK", "7 UK", "8 UK", "9 UK", "10 UK"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Size: $_selectedSize",
            style: AppTextStyles.bold14.copyWith(color: AppColors.onBackground),
          ),
          SizedBox(height: 12.h),
          Wrap(
            runSpacing: 10.h,
            spacing: 10.w,
            children: _sizes.map((size) => _buildSizeBox(size)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeBox(String size) {
    bool isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primary, width: 1.5.w),
        ),
        child: Text(
          size,
          style: AppTextStyles.semiBold14.copyWith(
            color: isSelected ? Colors.white : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
