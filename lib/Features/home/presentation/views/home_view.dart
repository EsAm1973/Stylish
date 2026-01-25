import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/presentation/manager/navigation/navigation_cubit.dart';

import 'package:stylish/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:stylish/Features/nav%20bar/presentation/views/nav_bar_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: SafeArea(
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: const [
                HomeViewBody(),
                SizedBox.shrink(),
                SizedBox.shrink(),
                SizedBox.shrink(),
                SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const NavBarView(),
    );
  }
}
