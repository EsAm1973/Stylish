import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_button.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/login_navigation.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/or_continue_with_divider.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/signup_form.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/signup_title.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/social_login_buttons.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/terms_text.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignupTitle(),
          const SignupForm(),
          SizedBox(height: 9.h),
          const TermsText(),
          SizedBox(height: 38.h),
          CustomButton(text: 'Create Account', onPressed: () {}),
          SizedBox(height: 40.h),
          const OrContinueWithDivider(),
          SizedBox(height: 20.h),
          const SocialLoginButtons(),
          SizedBox(height: 28.h),
          const LoginNavigation(),
        ],
      ),
    );
  }
}
