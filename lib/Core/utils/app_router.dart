import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/views/login_view.dart';
import 'package:stylish/Features/auth/presentation/views/signup_view.dart';
import 'package:stylish/Features/splash/presentation/views/splash_view.dart';
import 'package:stylish/Features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kSignupRoute = '/signup';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupRoute,
        builder: (context, state) => const SignupView(),
      ),
    ],
  );
}
