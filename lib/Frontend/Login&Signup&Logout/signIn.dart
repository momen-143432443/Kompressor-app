import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        key: loginController.loginFormKey,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(),
                child: Center(
                  child: Column(
                    children: [
                      k,
                      hSpacE,
                      emailSignInTextField,
                      h2,
                      passwordSignInTextField,
                      remeberMeAndForgetPassword,
                      hSpacE,
                      loginButton,
                      quickSign,
                      helpCneter,
                      hSpacE,
                      youDontHaveAnAccountPressToSignUp
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
