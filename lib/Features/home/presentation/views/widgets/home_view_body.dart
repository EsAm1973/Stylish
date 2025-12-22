import 'package:flutter/material.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/home/presentation/views/widgets/category_listview.dart';
import 'package:stylish/Features/home/presentation/views/widgets/feature_header.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(),
        const SliverToBoxAdapter(child: SearchTextField()),
        const SliverToBoxAdapter(child: FeaturedHeader()),
        SliverToBoxAdapter(child: CategoryListView()),
      ],
    );
  }
}
