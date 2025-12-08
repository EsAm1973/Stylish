import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Core/services/getit_service.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/presentation/manager/register/register_cubit.dart';
import 'package:stylish/Features/auth/presentation/views/forget_pass_view.dart';
import 'package:stylish/Features/auth/presentation/views/login_view.dart';
import 'package:stylish/Features/auth/presentation/views/signup_view.dart';
import 'package:stylish/Features/splash/presentation/views/splash_view.dart';
import 'package:stylish/Features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kSignupRoute = '/signup';
  static const String kForgetPasswordRoute = '/forgetPassword';

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
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getit<AuthRepo>()),
          child: const SignupView(),
        ),
      ),
      GoRoute(
        path: kForgetPasswordRoute,
        builder: (context, state) => const ForgetPassView(),
      ),
    ],
  );
}
