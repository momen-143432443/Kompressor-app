import 'package:ecar/Backend/for_User/update_name_controller.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uicons/uicons.dart';

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
            UpdateBackButton(),
            UpdateLabel(),
            hSpacE,
            UpdateTextField(updateController: updateController),
            hSpacE,
            UpdateButton(updateController: updateController)
          ],
        ),
      )),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.updateController,
  });

  final UpdateNameController updateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfButton.width / 1.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () async => await updateController.updateName(),
          child: const Text(
            'Save',
            style: TextStyle(color: white),
          )),
    );
  }
}

class UpdateTextField extends StatelessWidget {
  const UpdateTextField({
    super.key,
    required this.updateController,
  });

  final UpdateNameController updateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: updateController.name,
      expands: false,
      decoration: InputDecoration(
          labelText: 'Full name', prefixIcon: Icon(UIcons.regularRounded.user)),
    );
  }
}

class UpdateLabel extends StatelessWidget {
  const UpdateLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Use real name for easy verfication, this name will appear on several pages.",
      style: TextStyle(color: carGrey),
    );
  }
}

class UpdateBackButton extends StatelessWidget {
  const UpdateBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Center(
            child: Text(
          "Update the name",
          style: GoogleFonts.balooDa2(
            fontWeight: FontWeight.w800,
          ),
        )),
        Icon(UIcons.boldRounded.document, color: Colors.transparent)
      ],
    );
  }
}
