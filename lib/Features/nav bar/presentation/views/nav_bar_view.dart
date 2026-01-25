import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/home/presentation/manager/navigation/navigation_cubit.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: Colors.red);
              }
              return const IconThemeData(color: Colors.black);
            }),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                );
              }
              return const TextStyle(color: Colors.black, fontSize: 12);
            }),
          ),
          child: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                selectedIcon: Icon(Icons.home_outlined),
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'Wishlist',
                selectedIcon: Icon(Icons.favorite_outline),
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
                selectedIcon: Icon(Icons.shopping_cart_outlined),
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
                selectedIcon: Icon(Icons.search),
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
                selectedIcon: Icon(Icons.settings_outlined),
              ),
            ],
            selectedIndex: state.selectedIndex,
            onDestinationSelected: (value) {
              context.read<NavigationCubit>().setSelectedIndex(value);
            },
          ),
        );
      },
    );
  }
}
