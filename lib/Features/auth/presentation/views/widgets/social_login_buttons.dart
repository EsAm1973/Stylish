import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'social_login_icon.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginIcon(
          assetPath: 'assets/icons/google_icon.svg',
          onTap: () {
            // Handle Google login
          },
        ),
        SizedBox(width: 24.w),
        SocialLoginIcon(
          assetPath: 'assets/icons/apple_icon.svg',
          onTap: () {
            // Handle Apple login
          },
        ),
        SizedBox(width: 24.w),
        SocialLoginIcon(
          assetPath: 'assets/icons/facebook_icon.svg',
          onTap: () {
            // Handle Facebook login
          },
        ),
      ],
    );
  }
}
