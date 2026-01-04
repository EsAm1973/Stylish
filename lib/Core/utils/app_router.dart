import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Core/repos/profile/profile_repo.dart';
import 'package:stylish/Features/categories/data/repos/categories_repo.dart';
import 'package:stylish/Features/categories/presentation/manager/category_products_cubit/category_products_cubit.dart';
import 'package:stylish/Features/categories/presentation/views/category_view.dart';
import 'package:stylish/Features/categories/presentation/views/product_details_view.dart';
import 'package:stylish/Features/get%20started/presentation/views/get_started_view.dart';
import 'package:stylish/Features/home/data/repos/home_repo.dart';
import 'package:stylish/Features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Core/services/getit_service.dart';
import 'package:stylish/Features/auth/data/repos/auth_repo.dart';
import 'package:stylish/Features/auth/presentation/manager/login/login_cubit.dart';
import 'package:stylish/Features/auth/presentation/manager/register/register_cubit.dart';
import 'package:stylish/Features/auth/presentation/views/forget_pass_view.dart';
import 'package:stylish/Features/auth/presentation/views/login_view.dart';
import 'package:stylish/Features/auth/presentation/views/signup_view.dart';
import 'package:stylish/Features/splash/presentation/views/splash_view.dart';
import 'package:stylish/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:stylish/Features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/products_cubit/products_cubit.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kHomeRoute = '/home';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kSignupRoute = '/signup';
  static const String kForgetPasswordRoute = '/forgetPassword';
  static const String kGetStartedRoute = '/getStarted';
  static const String kCategoryRoute = '/category';
  static const String kProductDetailsRoute = '/productDetails';

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
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getit<AuthRepo>()),
          child: const LoginView(),
        ),
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
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProfileCubit(getit<ProfileRepo>()),
            ),
            BlocProvider(
              create: (context) => CategoriesCubit(getit<HomeRepo>()),
            ),
            BlocProvider(create: (context) => ProductsCubit(getit<HomeRepo>())),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kGetStartedRoute,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: kCategoryRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProfileCubit(getit<ProfileRepo>()),
            ),
            BlocProvider(
              create: (context) =>
                  CategoryProductsCubit(getit<CategoriesRepo>())
                    ..fetchCategoryProducts(categoryId: state.extra as int),
            ),
          ],
          child: const CategoryView(),
        ),
      ),
      GoRoute(
        path: kProductDetailsRoute,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}
