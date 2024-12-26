import 'package:ecar/Backend/CarStructure/carController.dart';
import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/main.dart';
import 'package:ecar/tools/navigationBar.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarUploadimage extends StatefulWidget {
  const CarUploadimage({super.key});

  @override
  State<CarUploadimage> createState() => _CarUploadimageState();
}

class _CarUploadimageState extends State<CarUploadimage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CarController());
    final networkImage = controller.user.value.userPic;
    final image = networkImage.isNotEmpty ? networkImage : '';
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UploadPictureOfCarAndPushToNavi(
                controller: controller, image: image),
            PushingToNavi()
          ],
        ),
      )),
    );
  }
}

class UploadPictureOfCarAndPushToNavi extends StatelessWidget {
  const UploadPictureOfCarAndPushToNavi({
    super.key,
    required this.controller,
    required this.image,
  });

  final CarController controller;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await controller.uploadCarPic(),
      child: SizedBox(
          width: widthOfImages.width,
          height: widthOfImages.height / 1.2,
          child: UploadImageSign(
            image: image,
            fit: BoxFit.cover,
            width: 100,
            height: 50,
          )),
    );
  }
}

class PushingToNavi extends StatelessWidget {
  const PushingToNavi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 180),
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {
            navigatorKey.currentState?.pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const NaviBar(),
                ),
                (route) => false);
          },
          child: const Text(
            "Save and Countinue",
            style: TextStyle(color: white),
          )),
    );
  }
}
