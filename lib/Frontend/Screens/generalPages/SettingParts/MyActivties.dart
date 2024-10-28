import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

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
            children: [myActivitiesText, yourNoteAndArchive],
          ),
        ),
      )),
    );
  }
}
