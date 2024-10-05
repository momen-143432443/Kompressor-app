import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: signUpController.signUpKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: widthOfButton.height,
                child: Center(
                  child: Column(
                    children: [
                      kom,
                      fullnameTextField,
                      h2,
                      emailSignUpTextField,
                      h2,
                      passwordSignUpTextField,
                      h2,
                      phoneNum,
                      hSpacE,
                      signUpButton,
                      w,
                      quickRegister,
                      w,
                      helpCneter,
                      backToSignIn
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}
