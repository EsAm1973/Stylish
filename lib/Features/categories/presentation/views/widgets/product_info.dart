import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/utils/app_colors.dart';
import 'package:stylish/Core/utils/app_text_style.dart';

import 'package:stylish/Features/home/data/models/product_model.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key, required this.product});

  final ProductModel product;

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
          Text(widget.product.title, style: AppTextStyles.bold21),
          SizedBox(height: 8.h),
          Text(
            widget.product.description,
            style: AppTextStyles.regular14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  index < (widget.product.rating ?? 0).floor()
                      ? Icons.star
                      : (index < (widget.product.rating ?? 0)
                            ? Icons.star_half
                            : Icons.star_border),
                  color: const Color(0xFFEDB310),
                  size: 20,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                widget.product.reviewCount?.toString() ?? "0",
                style: AppTextStyles.regular12,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              if (widget.product.originalPrice != null)
                Text(
                  "₹${widget.product.originalPrice}",
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.textGrey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              if (widget.product.originalPrice != null) SizedBox(width: 8.w),
              Text(
                "₹${widget.product.price}",
                style: AppTextStyles.bold14.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (widget.product.discount != null) SizedBox(width: 8.w),
              if (widget.product.discount != null)
                Text(
                  widget.product.discount!,
                  style: AppTextStyles.semiBold14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            "Product Details",
            style: AppTextStyles.bold14.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
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
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                          (_isExpanded ||
                              widget.product.description.length <=
                                  _truncateLimit)
                          ? widget.product.description
                          : "${widget.product.description.substring(0, _truncateLimit)}... ",
                    ),
                    if (widget.product.description.length > _truncateLimit)
                      TextSpan(
                        text: _isExpanded ? " Less" : "More",
                        style: AppTextStyles.semiBold12.copyWith(
                          color: Theme.of(context).colorScheme.primary,
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
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
