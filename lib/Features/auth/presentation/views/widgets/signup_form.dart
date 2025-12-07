import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish/Core/widgets/custom_text_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _nameController,
          hintText: 'Full Name',
          prefixIcon: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            size: 24.sp,
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 30.h),
        CustomTextField(
          controller: _emailController,
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email,
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
          textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 30.h),
        CustomTextField(
          controller: _confirmPasswordController,
          hintText: 'Confirm Password',
          obscureText: _obscureConfirmPassword,
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            size: 24.sp,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              size: 20.sp,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => {},
        ),
      ],
    );
  }
}
