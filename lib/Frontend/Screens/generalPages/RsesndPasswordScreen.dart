import 'package:ecar/Backend/for_User/forget_password_controller.dart';
import 'package:ecar/Backend/validator.dart';
import 'package:ecar/Frontend/widgets.dart';
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
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Iconsax.back_square))
        ],
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(
        children: [
          const Icon(
            size: 130,
            Iconsax.check5,
            color: yellow,
          ),
          hSpace,
          Text(
            email,
            style: GoogleFonts.balooDa2(
              color: blueColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          hSpacE,
          Form(
            key: controller.forgetPasswordFormkey,
            child: TextFormField(
              controller: controller.email,
              validator: ValidatorExe.validateEmail,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
            ),
          ),
          hSpacE,
          Center(
            child: ElevatedButton(
                onPressed: () async => await controller.forgetPassword(),
                child: const Text('Resend the password')),
          )
        ],
      ))),
    );
  }
}
