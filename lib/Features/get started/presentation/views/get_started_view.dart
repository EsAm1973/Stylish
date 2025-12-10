import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Core/services/shared_prefs.dart';
import 'package:stylish/Core/utils/app_router.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Core/widgets/custom_button.dart';
import 'package:stylish/constants.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/getstarted.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0, 0),
                    end: const Alignment(0, 1),
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.6),
                    ],
                    stops: [0.0, 0.4],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 130.h,
              left: 0,
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'You want Authentic, here you go!',
                    style: AppTextStyles.bold36.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Find it here, buy it now!',
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFFF2F2F2),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Prefs.setBool(isGetStartedViewSeenKey, true);
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeRoute);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
