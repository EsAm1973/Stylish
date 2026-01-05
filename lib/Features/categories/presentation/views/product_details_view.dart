import 'package:flutter/material.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_actions.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_viewbody.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductDetailsViewbody(product: product)),
      bottomNavigationBar: const ProductActionsBar(),
    );
  }
}
