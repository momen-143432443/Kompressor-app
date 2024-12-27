import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [LanguageText(), height1, EnglishAndArabic()],
          ),
        ),
      )),
    );
  }
}

class EnglishAndArabic extends StatelessWidget {
  const EnglishAndArabic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOfButton.width / 1.1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English', style: TextStyle(color: black, fontSize: 23)),
              Radio(
                value: false,
                groupValue: {},
                onChanged: (value) {},
              )
            ],
          ),
          size,
          size,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Arabic', style: TextStyle(color: black, fontSize: 23)),
              Radio(
                value: false,
                groupValue: {},
                onChanged: (value) {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class LanguageText extends StatelessWidget {
  const LanguageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Text('Languages', style: GoogleFonts.aleo(fontSize: 23, color: black)),
        Icon(
          Iconsax.backward,
          color: Colors.transparent,
        )
      ],
    );
  }
}
