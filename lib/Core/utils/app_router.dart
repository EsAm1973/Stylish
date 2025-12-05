import 'package:go_router/go_router.dart';
import 'package:stylish/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashRoute,
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
