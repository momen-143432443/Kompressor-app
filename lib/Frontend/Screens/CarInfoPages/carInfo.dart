import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
          AddCarText(),
          size,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarMakeText(),
              size,
              CarMakeTextField(),
              size,
              CarModelText(),
              size,
              CarModelTextField(),
              size,
              CarYearText(),
              size,
              CarYearTextField(),
              size,
              CarNameText(),
              size,
              CarNameTextField(),
              CarNextPageButton()
            ],
          )
        ],
      ))),
    );
  }
}

class CarNextPageButton extends StatelessWidget {
  const CarNextPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: T.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(33)),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
              onPressed: () => carController.storeCarData(),
              child: Text("Save and continue",
                  style: GoogleFonts.balooDa2(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ))),
        ));
  }
}

class CarNameTextField extends StatelessWidget {
  const CarNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextFormField(
          controller: carController.nameUrCar,
          autocorrect: true,
          enableInteractiveSelection: true,
          cursorColor: Colors.white,
          style: const TextStyle(color: black),
          decoration: InputDecoration(
            suffixIcon: const Icon(Iconsax.car,
                color: Color.fromARGB(255, 126, 126, 126)),
            labelText: 'Name your car',
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: const Color.fromARGB(255, 222, 222, 222),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none)),
          ),
        ),
      ),
    );
  }
}

class CarNameText extends StatelessWidget {
  const CarNameText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Car name",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CarYearTextField extends StatelessWidget {
  const CarYearTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: carController.carYear,
        cursorRadius: const Radius.circular(3),
        autocorrect: true,
        enableInteractiveSelection: true,
        cursorColor: Colors.white,
        style: const TextStyle(color: black),
        decoration: InputDecoration(
          suffixIcon: const Icon(Iconsax.car, color: carGrey),
          labelText: 'Car Year',
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color.fromARGB(255, 222, 222, 222),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }
}

class CarYearText extends StatelessWidget {
  const CarYearText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Year",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CarModelTextField extends StatelessWidget {
  const CarModelTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: carController.carModel,
        cursorRadius: const Radius.circular(3),
        autocorrect: true,
        enableInteractiveSelection: true,
        cursorColor: Colors.white,
        style: const TextStyle(color: black),
        decoration: InputDecoration(
          suffixIcon: const Icon(Iconsax.car, color: carGrey),
          labelText: 'Car model',
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: const Color.fromARGB(255, 222, 222, 222),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        ),
      ),
    );
  }
}

class CarModelText extends StatelessWidget {
  const CarModelText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Model",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class CarMakeTextField extends StatelessWidget {
  const CarMakeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: carController.carMake,
          cursorRadius: const Radius.circular(3),
          autocorrect: true,
          enableInteractiveSelection: true,
          cursorColor: Colors.white,
          style: const TextStyle(color: black),
          decoration: InputDecoration(
            suffixIcon: const Icon(Iconsax.car, color: carGrey),
            labelText: 'Car make',
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: const Color.fromARGB(255, 222, 222, 222),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none)),
          ),
        ),
      ),
    );
  }
}

class CarMakeText extends StatelessWidget {
  const CarMakeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Make",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class AddCarText extends StatelessWidget {
  const AddCarText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Add a car",
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
      ),
    );
  }
}
