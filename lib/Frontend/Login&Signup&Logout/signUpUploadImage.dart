import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class Signupuploadimage extends StatefulWidget {
  const Signupuploadimage({super.key});

  @override
  State<Signupuploadimage> createState() => _SignupuploadimageState();
}

class _SignupuploadimageState extends State<Signupuploadimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textPic,
            uploadPicSignUp(),
            naviTextBotton,
          ],
        ),
      )),
    );
  }
}
