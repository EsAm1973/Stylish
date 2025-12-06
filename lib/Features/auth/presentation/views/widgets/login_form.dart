import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Core/utils/app_router.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Core/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _usernameController,
          hintText: 'Username or Email',
          prefixIcon: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            size: 24.sp,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 30.h),
        CustomTextField(
          controller: _passwordController,
          hintText: 'Password',
          obscureText: _obscurePassword,
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            size: 24.sp,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              size: 20.sp,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => {},
        ),
        SizedBox(height: 9.h),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kForgetPasswordRoute);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.regular12.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
