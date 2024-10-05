import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class Reauthpage extends StatefulWidget {
  const Reauthpage({super.key});

  @override
  State<Reauthpage> createState() => _ReauthpageState();
}

class _ReauthpageState extends State<Reauthpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: appSym,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              backButton,
              wearingText,
              hSpacE,
              verfiyEmailField,
              hSpacE,
              verfiyPasswordField,
              hSpacE,
              reauthButton
            ],
          ),
        )),
      ),
    );
  }
}
