import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_state.dart';

class FilterCategoryWidget extends StatelessWidget {
  const FilterCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        int itemsCount = 0;
        if (state is CategoryProductsSuccess) {
          itemsCount = state.products.length;
        } else if (state is CategoryProductsPaginationLoading) {
          itemsCount = state.products.length;
        } else if (state is CategoryProductsPaginationFailure) {
          itemsCount = state.products.length;
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
          child: Row(
            children: [
              Text(
                '${itemsCount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} Items',
                style: AppTextStyles.bold18,
              ),
              const Spacer(),
              _buildActionButton(
                label: 'Sort',
                icon: Icons.swap_vert,
                onTap: () {},
                context: context,
              ),
              SizedBox(width: 8.w),
              _buildActionButton(
                label: 'Filter',
                icon: Icons.filter_alt_outlined,
                onTap: () {},
                context: context,
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to keep code DRY and maintain consistent styling
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(label, style: AppTextStyles.bold12),
            SizedBox(width: 4.w),
            Icon(icon, size: 18.r, color: Theme.of(context).iconTheme.color),
          ],
        ),
      ),
    );
  }
}
