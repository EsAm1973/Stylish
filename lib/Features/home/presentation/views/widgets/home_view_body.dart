import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:stylish/Features/home/presentation/views/widgets/category_listview.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_listview.dart';
import 'package:stylish/Features/home/presentation/views/widgets/deal_of_theday.dart';
import 'package:stylish/Features/home/presentation/views/widgets/discount_carousel.dart';
import 'package:stylish/Features/home/presentation/views/widgets/feature_header.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';
import 'package:stylish/Features/home/presentation/views/widgets/trending_products_list.dart';
import 'package:stylish/Features/home/presentation/views/widgets/trinding_products.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid_shimmer.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_state.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<ProfileCubit>().fetchUserProfile();
    context.read<CategoriesCubit>().fetchCategories();
    context.read<ProductsCubit>().fetchProducts(isFirstTime: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ProductsCubit>().fetchProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        bool isSearchActive = context.watch<ProductsCubit>().isSearchActive;

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            const CustomSliverAppBar(isHome: true),
            SliverToBoxAdapter(
              child: SearchTextField(
                onChanged: (value) {
                  context.read<ProductsCubit>().searchProducts(value);
                },
              ),
            ),
            if (!isSearchActive) ...[
              const SliverToBoxAdapter(child: FeaturedHeader()),
              const SliverToBoxAdapter(child: CategoryListView()),
              const SliverToBoxAdapter(child: DiscountCarousel()),
              SliverToBoxAdapter(child: SizedBox(height: 16.0.h)),
              const SliverToBoxAdapter(child: DealOfTheDayBanner()),
              SliverToBoxAdapter(child: SizedBox(height: 16.0.h)),
              const SliverToBoxAdapter(child: DealListView()),
              const SliverToBoxAdapter(child: TrendingProductsBanner()),
              SliverToBoxAdapter(child: SizedBox(height: 16.0.h)),
              const SliverToBoxAdapter(child: TrendingProductsList()),
            ],
            if (isSearchActive) _buildSearchResults(state),
          ],
        );
      },
    );
  }

  Widget _buildSearchResults(ProductsState state) {
    if (state is ProductsSuccess) {
      return SliverMainAxisGroup(
        slivers: [
          CategoriesProductsGrid(products: state.products),
          if (!state.hasReachedMax)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      );
    } else if (state is ProductsLoading) {
      return const CategoriesProductsGridShimmer();
    } else if (state is ProductsFailure) {
      return SliverToBoxAdapter(
        child: Center(child: Text(state.failure.errorMessage)),
      );
    }
    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }
}
