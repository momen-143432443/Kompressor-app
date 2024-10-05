import 'package:ecar/Frontend/Login&Signup&Logout/signIn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Epcontroller extends GetxController {
  static Epcontroller get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
  void updatepageIndecator(index) => currentPageIndex.value = index;
  // jump to the specific dot selected page

  // upadate current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 1) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('=================Get Storage Next Buttton ====================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);

      if (kDebugMode) {
        print('=================Get Storage Auth repo====================');
        print(storage.read('IsFirstTime'));
      }
      Get.offAll(() => const SignIn());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void doNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
}
