import 'package:ecar/Backend/for_User/forget_password_controller.dart';
import 'package:ecar/Backend/validator.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordscreen extends StatelessWidget {
  const ForgetPasswordscreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [ReauthBackButton()],
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          CheckButton(),
          hSpace,
          EmailTxt(email: email),
          hSpacE,
          ResendPasswordForEmailSign(controller: controller),
          hSpacE,
          ResendPasswordButton(controller: controller)
        ],
      ))),
    );
  }
}

class ResendPasswordButton extends StatelessWidget {
  const ResendPasswordButton({
    super.key,
    required this.controller,
  });

  final ForgetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async => await controller.forgetPassword(),
          child: const Text('Resend the password')),
    );
  }
}

class ResendPasswordForEmailSign extends StatelessWidget {
  const ResendPasswordForEmailSign({
    super.key,
    required this.controller,
  });

  final ForgetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.forgetPasswordFormkey,
      child: TextFormField(
        controller: controller.email,
        validator: ValidatorExe.validateEmail,
        decoration: const InputDecoration(
            labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
      ),
    );
  }
}

class EmailTxt extends StatelessWidget {
  const EmailTxt({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: GoogleFonts.balooDa2(
        color: blueColor,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      size: 130,
      Iconsax.check5,
      color: yellow,
    );
  }
}

class ReauthBackButton extends StatelessWidget {
  const ReauthBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(), icon: const Icon(Iconsax.back_square));
  }
}
