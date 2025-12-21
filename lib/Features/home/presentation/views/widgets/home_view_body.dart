import 'package:flutter/material.dart';
import 'package:stylish/Core/widgets/custom_sliver_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [CustomSliverAppBar()]);
  }
}
