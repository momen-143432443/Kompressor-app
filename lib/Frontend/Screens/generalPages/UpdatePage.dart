import 'package:ecar/Backend/for_User/update_name_controller.dart';
import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final updateController = Get.put(UpdateNameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            updateBackButton,
            updateLabel,
            hSpacE,
            upddateTextField,
            hSpacE,
            updateButton
          ],
        ),
      )),
    );
  }
}
