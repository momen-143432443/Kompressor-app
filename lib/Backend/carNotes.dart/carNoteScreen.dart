import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Carnotescreen extends StatefulWidget {
  const Carnotescreen({super.key});

  @override
  State<Carnotescreen> createState() => _CarnotescreenState();
}

class _CarnotescreenState extends State<Carnotescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BackIconAndNoteText(),
            NoteLabel(),
            height1,
            SubjectFieldText(),
            hSpacE,
            TitleFieldText(),
            height,
            NoteButton()
          ],
        ),
      )),
    );
  }
}

class NoteButton extends StatelessWidget {
  const NoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      width: widthOfButton.width / 1.2,
      child: TextButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () => noteController.storeNotesData(),
          child: const Text(
            "post",
            style: TextStyle(color: white),
          )),
    );
  }
}

class TitleFieldText extends StatelessWidget {
  const TitleFieldText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 100,
      textCapitalization: TextCapitalization.sentences,
      controller: noteController.titleText,
      cursorRadius: const Radius.circular(3),
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Iconsax.note, color: carGrey),
        labelText: 'Title',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class SubjectFieldText extends StatelessWidget {
  const SubjectFieldText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: noteController.subjectText,
      cursorRadius: const Radius.circular(3),
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      maxLength: 40,
      decoration: InputDecoration(
        suffixIcon: const Icon(Iconsax.note, color: carGrey),
        labelText: 'Subject',
        labelStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class NoteLabel extends StatelessWidget {
  const NoteLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "You can now add note that you need to remember if you need something for your car.",
      style: TextStyle(color: carGrey, fontSize: 10),
    );
  }
}

class BackIconAndNoteText extends StatelessWidget {
  const BackIconAndNoteText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Text('Car notes', style: GoogleFonts.jua(color: black)),
        const Icon(Icons.cabin, color: Colors.transparent)
      ],
    );
  }
}
