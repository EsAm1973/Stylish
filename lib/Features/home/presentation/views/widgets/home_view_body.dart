import 'package:flutter/material.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/home/presentation/views/widgets/category_listview.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_listview.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_of_theday.dart';
import 'package:stylish/Features/home/presentation/views/widgets/discount_carousel.dart';
import 'package:stylish/Features/home/presentation/views/widgets/feature_header.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';
import 'package:stylish/Features/home/presentation/views/widgets/trending_products_list.dart';
import 'package:stylish/Features/home/presentation/views/widgets/trinding_products.dart';

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
        const SliverToBoxAdapter(child: DiscountCarousel()),
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        const SliverToBoxAdapter(child: DealOfTheDayBanner()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: DealListView(),
          ),
        ),
        const SliverToBoxAdapter(child: TrendingProductsBanner()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: TrendingProductsList(),
          ),
        ),
      ],
    );
  }
}
