import 'package:flutter/material.dart';
import 'package:passeio_aumigo/Screens/signup/components/resetpassword.dart';

import 'components/sign_up_body.dart';

class SignUpReset extends StatefulWidget {
  const SignUpReset({super.key});

  @override
  State<SignUpReset> createState() => _SignUpResetState();
}

class _SignUpResetState extends State<SignUpReset> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: ResetPassword(),
      ),
    ));
  }
}
