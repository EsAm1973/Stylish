import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Core/utils/app_router.dart';
import 'package:stylish/Core/widgets/custom_button.dart';
import 'package:stylish/Features/auth/presentation/manager/login/login_cubit.dart';
import 'package:stylish/Features/auth/presentation/manager/login/login_state.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/auth_dialog.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/login_form.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/or_continue_with_divider.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/signup_navigation.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/social_login_buttons.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/welcome_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<LoginFormState>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kGetStartedRoute);
        } else if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (context) =>
                AuthDialog(isSuccess: false, message: state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(),
              LoginForm(key: formKey),
              SizedBox(height: 52.h),
              CustomButton(
                text: isLoading ? 'Logging in...' : 'Login',
                onPressed: isLoading
                    ? () {}
                    : () {
                        final form = formKey.currentState;
                        if (form != null &&
                            form.formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                            email: form.email,
                            password: form.password,
                          );
                        }
                      },
              ),
              SizedBox(height: 75.h),
              const OrContinueWithDivider(),
              SizedBox(height: 20.h),
              const SocialLoginButtons(),
              SizedBox(height: 28.h),
              const SignupNavigation(),
            ],
          ),
        );
      },
    );
  }
}
