import 'package:ecar/Frontend/Screens/editorialPages/ep1.dart';
import 'package:ecar/Frontend/Screens/editorialPages/ep2.dart';
import 'package:ecar/Frontend/Screens/editorialPages/epController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorialPage extends StatefulWidget {
  const EditorialPage({super.key});

  @override
  State<EditorialPage> createState() => _EditorialPageState();
}

class _EditorialPageState extends State<EditorialPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Epcontroller());
    return Scaffold(
        body: PageView(
      controller: controller.pageController,
      onPageChanged: controller.updatepageIndecator,
      children: const [ScreenFirst(), SecondScreen()],
    ));
  }
}
