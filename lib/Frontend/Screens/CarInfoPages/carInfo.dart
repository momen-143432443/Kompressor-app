import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({super.key});

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addCarText,
          size,
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
              carNameText,
              size,
              carNameTextField,
              carNextPageButton
            ],
          )
        ],
      ))),
    );
  }
}
