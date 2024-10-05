import 'package:ecar/Frontend/widgets.dart';
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
                children: [
                  Text(
                    'Car services',
                    style: GoogleFonts.aleo(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: black),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(UIcons.regularRounded.inbox))
                ],
              ),
            ),
            height1,
            hSPACE,
            regularService,
            hSPACE,
            urgentService
          ],
        ),
      )),
    );
  }
}
