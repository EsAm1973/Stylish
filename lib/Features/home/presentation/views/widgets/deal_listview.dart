import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_state.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Features/home/data/models/category_model.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_product_item.dart';

class DealListView extends StatefulWidget {
  const DealListView({super.key});

  @override
  State<DealListView> createState() => _DealListViewState();
}

class _DealListViewState extends State<DealListView> {
  final ScrollController _scrollController = ScrollController();

  double get _getItemWidth => (MediaQuery.of(context).size.width - 20.w) / 2;

  void _scrollForward() {
    if (!_scrollController.hasClients) return;
    double targetOffset = _scrollController.offset + _getItemWidth;
    if (targetOffset > _scrollController.position.maxScrollExtent) {
      targetOffset = _scrollController.position.maxScrollExtent;
    }

    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = _getItemWidth;

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess || state is ProductsLoading) {
          final List<ProductModel> displayProducts = state is ProductsSuccess
              ? state.products
              : List.generate(
                  4,
                  (index) => ProductModel(
                    id: index,
                    title: 'Loading...',
                    price: 0,
                    description: 'Loading...',
                    images: [],
                    category: CategoryModel(id: 0, name: '', image: ''),
                  ),
                );

          return Skeletonizer(
            enabled: state is ProductsLoading,
            child: SizedBox(
              height: 270.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: displayProducts.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: itemWidth,
                        child: ProductItem(product: displayProducts[index]),
                      );
                    },
                  ),
                  if (state is ProductsSuccess && displayProducts.isNotEmpty)
                    Positioned(
                      right: 8.w,
                      child: GestureDetector(
                        onTap: _scrollForward,
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200.withOpacity(0.9),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.failure.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
