import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCarInfo extends StatefulWidget {
  const NewCarInfo({super.key});

  @override
  State<NewCarInfo> createState() => _NewCarInfoState();
}

class _NewCarInfoState extends State<NewCarInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            updateCarInfo,
            alertUpdate,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                carMakeText,
                size,
                carMakeTextField,
                size,
                carModelText,
                size,
                carModelTextField,
                size,
                carYearText,
                size,
                carYearTextField,
                size,
                Obx(
                  () {
                    final networkImage = carController.cars.value.carPic;
                    final image = networkImage.isNotEmpty ? networkImage : '';
                    return Stack(children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 219, 219, 219),
                              borderRadius: BorderRadius.circular(12)),
                          width: T.width / 1.1,
                          height: T.height / 3.5,
                          child: GestureDetector(
                            onTap: () async =>
                                await carController.uploadCarPic(),
                            child: SizedBox(
                                width: widthOfImages.width,
                                height: widthOfImages.height / 1.2,
                                child: CarUploadPic(
                                  image: image,
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 50,
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 26,
                          top: 140,
                          child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Upload car image',
                                style: GoogleFonts.balooDa2(
                                    color: white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25),
                              )))
                    ]);
                  },
                ),
                size,
                carNameText,
                size,
                carNameTextField,
                updateCarButton
              ],
            )
          ],
        ),
      )),
    );
  }
}
