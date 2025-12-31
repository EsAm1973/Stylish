import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/categories_products_grid_shimmer.dart';
import 'package:stylish/Features/categories/presentation/views/widgets/filter_category_widget.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_state.dart';
import 'package:stylish/Features/home/presentation/views/widgets/search_text_feild.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(isHome: false),
        const SliverToBoxAdapter(child: SearchTextField()),
        const SliverToBoxAdapter(child: FilterCategoryWidget()),
        BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsSuccess) {
              return CategoriesProductsGrid(products: state.products);
            } else if (state is ProductsLoading) {
              return const CategoriesProductsGridShimmer();
            } else if (state is ProductsFailure) {
              return SliverToBoxAdapter(
                child: Center(child: Text(state.failure.errorMessage)),
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
