import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

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
            backIconAndNoteText,
            noteLabel,
            height1,
            subjectFieldText,
            hSpacE,
            titleFieldText,
            height,
            noteButton
          ],
        ),
      )),
    );
  }
}
