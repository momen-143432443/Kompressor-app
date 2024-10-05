import 'package:ecar/Backend/connect.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Backend/for_User/user_respository.dart';
import 'package:ecar/Backend/Features/fullScreenLoader.dart';
import 'package:ecar/Frontend/Screens/generalPages/ProfileScreen.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final name = TextEditingController();
  final userController = ProfileController.instanse;
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    initName();
  }

  Future<void> initName() async {
    name.text = userController.user.value.fullname;
  }

  Future<void> updateName() async {
    try {
      // Start loading
      Fullscreenloader.openLoadingDialog('Just hold on for a while');
      // connect check
      // final isConnected = CheckConnect.instance.isConnected();
      // if (await isConnected) {
      //   return;
      // }
      // if (updateUserNameFormKey.currentState!.validate()) {
      //   return;
      // }
      Map<String, dynamic> username = {'FullName': name.text.trim()};
      await userRepo.updateSpecificData(username);

      userController.user.value.fullname == name.text.trim();
      Fullscreenloader.stopLoading();
      // userController.user.value.fullname
      Get.offAll(() => const ProfileScreen());
      Get.snackbar('Alert', 'Update successfully !',
          colorText: white,
          backgroundColor: green,
          icon: const Icon(Icons.update));
    } catch (e) {
      Fullscreenloader.stopLoading();

      Get.snackbar('Error', e.toString(),
          colorText: white,
          backgroundColor: redColor,
          icon: const Icon(Icons.error));
    }
  }
}
