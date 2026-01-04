import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewbody extends StatelessWidget {
  const ProductDetailsViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Product Details'),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [const Icon(Icons.shopping_cart), const SizedBox(width: 16)],
        ),
        const SliverToBoxAdapter(child: Column(children: [
              
            ],
          )),
      ],
    );
  }
}
