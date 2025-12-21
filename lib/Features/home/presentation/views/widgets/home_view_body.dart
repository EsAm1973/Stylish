import 'package:flutter/material.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/home/presentation/views/widgets/feature_header.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverToBoxAdapter(child: SearchTextField()),
        SliverToBoxAdapter(child: FeaturedHeader()),
      ],
    );
  }
}
