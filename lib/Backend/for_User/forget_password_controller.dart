import 'package:ecar/Backend/Features/fullScreenLoader.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/connect.dart';

import 'package:ecar/Frontend/Screens/generalPages/RsesndPasswordScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  // Variables

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  forgetPassword() async {
    try {
      await AuthenticationRespository.instance
          .forgetPasswordEmailUser(email.text.trim());

      // Start loading
      Fullscreenloader.openLoadingDialog('Loading for reset the password');
      // Check of the internet connection
      final isConnected = await CheckConnect.instance.isConnected();
      if (!isConnected) {
        Fullscreenloader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormkey.currentState!.validate()) {
        Fullscreenloader.stopLoading();
        return;
      }

      Fullscreenloader.stopLoading();

      Get.to(() => ForgetPasswordscreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      Fullscreenloader.stopLoading();
    }
  }

  resendPasswordEmail(String email) async {
    try {
      // Start loading
      Fullscreenloader.openLoadingDialog('Loading for reset the password');
      // Check of the internet connection
      final isConnected = await CheckConnect.instance.isConnected();
      if (!isConnected) {
        Fullscreenloader.stopLoading();
        return;
      }

      await AuthenticationRespository.instance.forgetPasswordEmailUser(email);

      Get.snackbar(
        "Sueccess",
        "Resent password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
      );

      Fullscreenloader.stopLoading();
    } catch (e) {
      Fullscreenloader.stopLoading();
    }
  }
}
