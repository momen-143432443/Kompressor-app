import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uicons/uicons.dart';

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
              BeckButtonOfReAuth(),
              WearingText(),
              hSpacE,
              VerfiyEmailField(),
              hSpacE,
              VerfiyPasswordField(),
              hSpacE,
              ReauthButton()
            ],
          ),
        )),
      ),
    );
  }
}

class ReauthButton extends StatelessWidget {
  const ReauthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfButton.width / 1.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: () => controller.reAuthenticationEmailAndPassword(),
        child: const Text(
          'Delete',
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}

class VerfiyPasswordField extends StatelessWidget {
  const VerfiyPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller.verfiyPassword,
        cursorRadius: const Radius.circular(3),
        autocorrect: true,
        obscureText: controller.hidePassword.value,
        enableInteractiveSelection: true,
        cursorColor: Colors.white,
        style: const TextStyle(color: black),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () => controller.hidePassword.value =
                  !controller.hidePassword.value,
              icon: controller.hidePassword.value
                  ? const Icon(
                      Iconsax.eye_slash,
                      color: blueColor,
                    )
                  : const Icon(
                      Iconsax.eye,
                      color: blueColor,
                    )),
          labelText: 'Password',
          labelStyle: const TextStyle(color: black),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }
}

class VerfiyEmailField extends StatelessWidget {
  const VerfiyEmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.verfiyEmail,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class WearingText extends StatelessWidget {
  const WearingText({
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

class BeckButtonOfReAuth extends StatelessWidget {
  const BeckButtonOfReAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        Center(
            child: Text(
          "Delete your account",
          style: GoogleFonts.balooDa2(
            fontWeight: FontWeight.w800,
          ),
        )),
        Icon(UIcons.boldRounded.document, color: Colors.transparent)
      ],
    );
  }
}
