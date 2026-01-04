import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/data/models/product_model.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_state.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid_shimmer.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/filter_category_widget.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key});

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<CategoryProductsCubit>().loadMoreCategoryProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const CustomSliverAppBar(isHome: false),
        SliverToBoxAdapter(
          child: SearchTextField(
            onChanged: (value) {
              context.read<CategoryProductsCubit>().searchCategoryProducts(
                value,
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: FilterCategoryWidget()),
        BlocConsumer<CategoryProductsCubit, CategoryProductsState>(
          listener: (context, state) {
            if (state is CategoryProductsPaginationFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            if (state is CategoryProductsSuccess ||
                state is CategoryProductsPaginationLoading ||
                state is CategoryProductsPaginationFailure) {
              List<ProductModel> products = [];
              if (state is CategoryProductsSuccess) {
                products = state.products;
              } else if (state is CategoryProductsPaginationLoading) {
                products = state.products;
              } else if (state is CategoryProductsPaginationFailure) {
                products = state.products;
              }

              return SliverMainAxisGroup(
                slivers: [
                  CategoriesProductsGrid(products: products),
                  if (state is CategoryProductsPaginationLoading)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              );
            } else if (state is CategoryProductsLoading) {
              return const CategoriesProductsGridShimmer();
            } else if (state is CategoryProductsFailure) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.errorMessage)),
              );
            } else {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }
          },
        ),
      ],
    );
  }
}
