import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class ProductImagesCarousel extends StatefulWidget {
  const ProductImagesCarousel({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late final List<String> _images = widget.product.images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. The Swipeable PageView
        SizedBox(
          height: 220.h,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _images.length,
            itemBuilder: (context, index) {
              return ProductImagesItem(image: _images[index]);
            },
          ),
        ),

        SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) => buildDot(index)),
        ),
      ],
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index
            ? Theme.of(context).primaryColor
            : Colors.grey.shade300,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class ProductImagesItem extends StatelessWidget {
  const ProductImagesItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: image.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade200,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red),
              )
            : Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
