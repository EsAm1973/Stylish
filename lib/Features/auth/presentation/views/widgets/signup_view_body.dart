import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_button.dart';
import 'package:stylish/Features/auth/presentation/manager/register/register_cubit.dart';
import 'package:stylish/Features/auth/presentation/manager/register/register_state.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/auth_dialog.dart';
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
    final formKey = GlobalKey<SignupFormState>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AuthDialog(
              isSuccess: true,
              message: 'Registration successful! Please login to continue.',
            ),
          );
        } else if (state is RegisterFailure) {
          showDialog(
            context: context,
            builder: (context) =>
                AuthDialog(isSuccess: false, message: state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupTitle(),
              SignupForm(key: formKey),
              SizedBox(height: 9.h),
              const TermsText(),
              SizedBox(height: 38.h),
              CustomButton(
                text: isLoading ? 'Creating Account...' : 'Create Account',
                onPressed: isLoading
                    ? () {}
                    : () {
                        final form = formKey.currentState;
                        if (form != null &&
                            form.formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            name: form.name,
                            email: form.email,
                            password: form.password,
                          );
                        }
                      },
              ),
              SizedBox(height: 40.h),
              const OrContinueWithDivider(),
              SizedBox(height: 20.h),
              const SocialLoginButtons(),
              SizedBox(height: 28.h),
              const LoginNavigation(),
            ],
          ),
        );
      },
    );
  }
}
