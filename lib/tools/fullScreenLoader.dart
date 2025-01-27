import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fullscreenloader {
  static void openLoadingDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => PopScope(
          canPop: false,
          child: SizedBox(
              width: 120,
              height: 120,
              child: Center(
                  child: Stack(children: [
                LoadingAnimationWidget.waveDots(color: white, size: 56),
                LoadingAnimationWidget.waveDots(color: blueColor, size: 55),
              ])))),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
