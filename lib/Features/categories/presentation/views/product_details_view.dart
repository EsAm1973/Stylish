import 'package:flutter/material.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_actions.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/product_details_viewbody.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProductDetailsViewbody()),
      bottomNavigationBar: ProductActionsBar(),
    );
  }
}
