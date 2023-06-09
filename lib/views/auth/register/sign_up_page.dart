import 'package:flutter/material.dart';
import 'package:lost_found/views/auth/register/sign_up_Form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SignUpForm()),
    );
  }
}
