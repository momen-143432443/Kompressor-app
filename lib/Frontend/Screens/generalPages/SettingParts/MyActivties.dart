import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [MyActivitiesText(), YourNoteAndArchive()],
          ),
        ),
      )),
    );
  }
}

class YourNoteAndArchive extends StatelessWidget {
  const YourNoteAndArchive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: widthOfButton.width / 3,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor: WidgetStatePropertyAll(blueColor)),
              onPressed: () {},
              child: const Text(
                "Your notes",
                style: TextStyle(color: white),
              )),
        ),
        h,
        SizedBox(
          width: widthOfButton.width / 3,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  backgroundColor: WidgetStatePropertyAll(blueColor)),
              onPressed: () {},
              child: const Text(
                "Archive",
                style: TextStyle(color: white),
              )),
        ),
      ],
    );
  }
}

class MyActivitiesText extends StatelessWidget {
  const MyActivitiesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Text('My Activities',
            style: GoogleFonts.aleo(fontSize: 23, color: black)),
        Icon(
          Iconsax.backward,
          color: Colors.transparent,
        )
      ],
    );
  }
}
