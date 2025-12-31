import 'package:flutter/material.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(isHome: false),
        SliverToBoxAdapter(child: SearchTextField()),
      ],
    );
  }
}
