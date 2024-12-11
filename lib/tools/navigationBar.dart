import 'package:ecar/Frontend/Screens/generalPages/Explore.dart';
import 'package:ecar/Frontend/Screens/generalPages/Home.dart';
import 'package:ecar/Frontend/Screens/generalPages/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:google_fonts/google_fonts.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int index = 0;
  final pages = [const Home(), const Noti(), const Explore()];
  final homeText = GoogleFonts.balooDa2(color: blueColor);
  final notiText = GoogleFonts.balooDa2(color: blueColor);
  final expText = GoogleFonts.balooDa2(color: blueColor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: MoltenBottomNavigationBar(
        domeCircleSize: 45,
        barHeight: 50,
        borderSize: 1,
        margin: const EdgeInsets.only(bottom: 2),
        borderRaduis: BorderRadius.circular(22),
        duration: const Duration(milliseconds: 400),
        borderColor: blueColor,
        curve: Curves.ease,
        domeCircleColor: blueColor,
        domeHeight: 1,
        tabs: [
          MoltenTab(
            icon: const Icon(Iconsax.home),
            selectedColor: Colors.white,
            unselectedColor: blueColor,
            title: Text(
              'home',
              style: homeText,
            ),
          ),
          MoltenTab(
            icon: const Icon(Iconsax.notification),
            title: Text(
              "Notification",
              style: notiText,
            ),
            selectedColor: Colors.white,
            unselectedColor: blueColor,
          ),
          MoltenTab(
            icon: const Icon(Icons.room_service_rounded),
            title: Text("Services", style: expText),
            selectedColor: Colors.white,
            unselectedColor: blueColor,
          ),
        ],
        selectedIndex: index,
        onTabChange: (indexs) {
          setState(() {
            index = indexs;
          });
        },
      ),
    );
  }
}
