// lib/Features/splash/presentation/views/splash_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/Core/services/shared_prefs.dart';
import 'package:stylish/Core/utils/app_router.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/Core/services/getit_service.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:stylish/Features/auth/data/model/authentication_pair.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    // Check for existing token
    final tokenStorage = getit<TokenStorage<TokensPair>>();
    final token = await tokenStorage.read();

    if (token != null) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeRoute);
        }
      });
      return;
    }

    bool isOnboardingViewed = Prefs.getBool(isOnboadingViewSeenKey);
    if (isOnboardingViewed) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginRoute);
        }
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnboardingRoute);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 125.w,
                height: 100.h,
              ),
              SizedBox(width: 10.w),
              Text(
                'Stylish',
                style: GoogleFonts.libreCaslonText(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
