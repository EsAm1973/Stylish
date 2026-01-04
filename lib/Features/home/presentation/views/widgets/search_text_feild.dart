import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search any Product..',
          hintStyle: AppTextStyles.regular14,
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 28.r),
          suffixIcon: Icon(
            Icons.mic_none_outlined,
            color: Colors.grey,
            size: 28.r,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
              width: .5.w,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
        ),
      ),
    );
  }
}
