import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          backSetting,
          userController(),
          editProfile,
          carListInfo(),
          const Divider(),
          deleteCarInfo
        ])),
      ),
    );
  }
}
