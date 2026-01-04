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
                onTap: () => _showFilterBottomSheet(context),
                context: context,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    final cubit = context.read<CategoryProductsCubit>();
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    final minPriceController = TextEditingController();
    final maxPriceController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: 24.h,
            left: 24.w,
            right: 24.w,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text('Filter Products', style: AppTextStyles.extraBold24),
                SizedBox(height: 24.h),
                _buildTextField(
                  label: 'Product Title',
                  controller: titleController,
                  hint: 'e.g. Generic',
                ),
                SizedBox(height: 16.h),
                _buildTextField(
                  label: 'Exact Price',
                  controller: priceController,
                  hint: 'e.g. 100',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        label: 'Min Price',
                        controller: minPriceController,
                        hint: '0',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildTextField(
                        label: 'Max Price',
                        controller: maxPriceController,
                        hint: '1000',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          cubit.resetFilters();
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: const Text('Reset'),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.applyFilters(
                            title: titleController.text.isNotEmpty
                                ? titleController.text
                                : null,
                            price: num.tryParse(priceController.text),
                            priceMin: num.tryParse(minPriceController.text),
                            priceMax: num.tryParse(maxPriceController.text),
                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: const Text('Apply'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
          child: Text(label, style: AppTextStyles.bold14),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.regular14.copyWith(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: Colors.black),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
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
