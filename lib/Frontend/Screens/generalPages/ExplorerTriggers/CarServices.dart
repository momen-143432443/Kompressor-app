import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uicons/uicons.dart';

class CarServices extends StatefulWidget {
  const CarServices({super.key});

  @override
  State<CarServices> createState() => _CarServicesState();
}

class _CarServicesState extends State<CarServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: appSym,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CarService(), Inbox()],
              ),
            ),
            height1,
            hSPACE,
            RegularServicesText(),
            RegularService(),
            hSPACE,
            UrgentServicesText(),
            UrgentService()
          ],
        ),
      )),
    );
  }
}

class UrgentServicesText extends StatelessWidget {
  const UrgentServicesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 220),
      child: Text(
        "Urgent services",
        style: GoogleFonts.aleo(
            fontSize: 25, fontWeight: FontWeight.w500, color: black),
      ),
    );
  }
}

class RegularServicesText extends StatelessWidget {
  const RegularServicesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 220),
      child: Text(
        "Regular services",
        style: GoogleFonts.aleo(
            fontSize: 25, fontWeight: FontWeight.w500, color: black),
      ),
    );
  }
}

class UrgentService extends StatelessWidget {
  const UrgentService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthOfButton.height / 2.6 + 15,
      width: widthOfImages.width / 1.07,
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('got to urgent gaz');
                },
                child: SizedBox(
                  width: widthOfButton.width / 3.6,
                  height: widthOfButton.height / 5,
                  child: Card(
                    color: carGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          UIcons.regularStraight.oil_can,
                          size: 25,
                          color: white,
                        ),
                        Icon(
                          UIcons.regularRounded.car,
                          size: 45,
                          color: white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text('Urgent\ngaz',
                              style: GoogleFonts.aleo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Call Winsh');
                },
                child: SizedBox(
                  width: widthOfButton.width / 3.6,
                  height: widthOfButton.height / 5,
                  child: Card(
                    color: carGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          UIcons.regularRounded.wind,
                          size: 45,
                          color: white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Call\n winsh",
                              style: GoogleFonts.aleo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('urgent repair');
                },
                child: SizedBox(
                  width: widthOfButton.width / 3.6,
                  height: widthOfButton.height / 5,
                  child: Card(
                    color: carGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 25,
                          color: white,
                        ),
                        Icon(
                          UIcons.regularRounded.car,
                          size: 45,
                          color: white,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Car\n repairing",
                              style: GoogleFonts.aleo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              print('urgent electircity');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.electrical_services_outlined,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Urgent\neletric charge",
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RegularService extends StatelessWidget {
  const RegularService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widthOfButton.height / 4.4,
      width: widthOfImages.width / 1.07,
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print('got to washing');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('Car\nwashing',
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('changing oil');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      UIcons.regularRounded.oil_can,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Changing\n oil",
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('repair');
            },
            child: SizedBox(
              width: widthOfButton.width / 3.6,
              height: widthOfButton.height / 5,
              child: Card(
                color: carGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 25,
                      color: white,
                    ),
                    Icon(
                      UIcons.regularRounded.car,
                      size: 45,
                      color: white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text("Car\n repairing",
                          style: GoogleFonts.aleo(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: white)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Inbox extends StatelessWidget {
  const Inbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: Icon(UIcons.regularRounded.inbox));
  }
}

class CarService extends StatelessWidget {
  const CarService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Car services',
      style: GoogleFonts.aleo(
          fontSize: 24, fontWeight: FontWeight.w500, color: black),
    );
  }
}
