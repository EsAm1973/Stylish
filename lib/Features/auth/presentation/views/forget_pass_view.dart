import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/views/widgets/forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ForgetPassViewBody()));
  }
}
