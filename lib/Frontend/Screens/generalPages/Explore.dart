import 'package:animate_do/animate_do.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/CarServices.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/Eshop/Eshop.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/KWallet.dart';
import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/TelephonePage.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uicons/uicons.dart';
import 'dart:math' as math;

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [Ads(), Services(), Payment()],
        ),
      )),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(seconds: 4),
      child: Center(
        child: GestureDetector(
          onTap: () => Get.to(() => const KWallet()),
          child: SizedBox(
            height: widthOfButton.height / 5,
            width: widthOfButton.width / 1.3,
            child: Card(
              color: orange,
              child: Center(
                child: Stack(children: [
                  Text(
                    'K',
                    style: GoogleFonts.jua(fontSize: 100, color: blueColor),
                  ),
                  Transform.rotate(
                    angle: math.pi / 9,
                    child: Text(
                      "Wallet",
                      style: GoogleFonts.jua(fontSize: 72, color: white),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        if (index == 0) {
          return FadeInLeft(
            child: GestureDetector(
              onTap: () => Get.to(() => const TelephonePage()),
              child: Card(
                  color: grey,
                  child: Stack(
                    children: [
                      Positioned(
                          right: 24,
                          child: Icon(
                            Icons.phone,
                            size: 200,
                            color: black.withOpacity(0.1),
                          )),
                      Center(
                        child: Text('TelePhones',
                            style: GoogleFonts.aleo(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: black)),
                      ),
                    ],
                  )),
            ),
          );
        } else if (index == 1) {
          return FadeInRight(
            delay: const Duration(seconds: 2),
            child: GestureDetector(
              onTap: () => Get.to(() => const EShop()),
              child: Card(
                color: blueColor,
                child: Stack(children: [
                  Positioned(
                      right: 24,
                      child: Icon(
                        Iconsax.shop,
                        size: 200,
                        color: white.withOpacity(0.1),
                      )),
                  Center(
                    child: Text('E-shop',
                        style: GoogleFonts.aleo(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: white)),
                  ),
                ]),
              ),
            ),
          );
        } else if (index == 2) {
          return FadeInLeft(
            delay: const Duration(seconds: 1),
            child: GestureDetector(
              onTap: () => Get.to(() => const CarServices()),
              child: Card(
                color: green,
                child: Stack(children: [
                  Positioned(
                      right: 24,
                      child: Icon(
                        Iconsax.discount_circle,
                        size: 200,
                        color: white.withOpacity(0.1),
                      )),
                  Center(
                    child: Text('Car services',
                        style: GoogleFonts.aleo(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: white)),
                  ),
                ]),
              ),
            ),
          );
        } else if (index == 3) {
          return FadeInRight(
            delay: const Duration(seconds: 3),
            child: GestureDetector(
              onTap: () {
                print('Go to news');
              },
              child: Card(
                color: black,
                child: Stack(children: [
                  Positioned(
                      right: 24,
                      child: Icon(
                        UIcons.regularRounded.paper_plane,
                        size: 200,
                        color: white.withOpacity(0.1),
                      )),
                  Center(
                    child: Text('News',
                        style: GoogleFonts.aleo(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: white)),
                  ),
                ]),
              ),
            ),
          );
        }
        return const Text('No Data');
      },
    );
  }
}

class Ads extends StatelessWidget {
  const Ads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(seconds: 5),
      child: Center(
        child: SizedBox(
          height: widthOfButton.height / 5,
          width: widthOfButton.width / 1.3,
          child: Card(
            color: milkyblue,
            child: Stack(children: [
              Positioned(
                  right: 24,
                  child: Icon(
                    Iconsax.folder,
                    size: 200,
                    color: white.withOpacity(0.1),
                  )),
              Center(
                child: Text('Advertisements',
                    style: GoogleFonts.aleo(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: white)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
