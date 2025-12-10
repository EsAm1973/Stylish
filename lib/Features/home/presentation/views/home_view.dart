import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:stylish/Core/utils/app_router.dart';
import 'package:stylish/Core/services/getit_service.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Logout logic
              await getit<Fresh<TokensPair>>().setToken(null);
              if (context.mounted) {
                GoRouter.of(context).go(AppRouter.kLoginRoute);
              }
            },
          ),
        ],
      ),
      body: const Center(child: Text('Welcome Home!')),
    );
  }
}
