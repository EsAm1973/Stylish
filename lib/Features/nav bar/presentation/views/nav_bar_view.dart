import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
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
            indicatorColor: Theme.of(context).colorScheme.surface,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(
                  color: Theme.of(context).colorScheme.primary,
                );
              }
              return IconThemeData(
                color: Theme.of(context).colorScheme.onSurface,
              );
            }),
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                );
              }
              return TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12.sp,
              );
            }),
          ),
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome03,
                  size: 30.0.sp,
                ),
                label: 'Home',
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome03,
                  size: 30.0.sp,
                ),
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedFavourite,
                  size: 30.0.sp,
                ),
                label: 'Wishlist',
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedFavourite,
                  size: 30.0.sp,
                ),
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedShoppingBasket01,
                  size: 30.0.sp,
                ),
                label: 'Cart',
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedShoppingBasket01,
                  size: 30.0.sp,
                ),
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  size: 30.0.sp,
                ),
                label: 'Search',
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  size: 30.0.sp,
                ),
              ),
              NavigationDestination(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSettings03,
                  size: 30.0.sp,
                ),
                label: 'Settings',
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSettings03,
                  size: 30.0.sp,
                ),
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
