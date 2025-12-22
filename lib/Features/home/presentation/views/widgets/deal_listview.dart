import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_product_item.dart';
import 'package:stylish/constants.dart';

class DealListView extends StatefulWidget {
  const DealListView({super.key});

  @override
  State<DealListView> createState() => _DealListViewState();
}

class _DealListViewState extends State<DealListView> {
  final ScrollController _scrollController = ScrollController();

  // Helper method to calculate item width based on screen size
  double get _getItemWidth => (MediaQuery.of(context).size.width - 32.w) / 2;

  void _scrollForward() {
    // Scroll by the width of exactly one item
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
    // Calculate width once to use in the builder and the sizing
    final double itemWidth = _getItemWidth;

    return SizedBox(
      height: 280.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: itemWidth,
                child: ProductItem(product: products[index]),
              );
            },
          ),

          // Navigation Arrow (Floating)
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
    );
  }
}
