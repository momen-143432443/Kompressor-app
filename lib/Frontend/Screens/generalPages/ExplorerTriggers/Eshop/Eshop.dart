import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';

class EShop extends StatefulWidget {
  const EShop({super.key});

  @override
  State<EShop> createState() => _EShopState();
}

class _EShopState extends State<EShop> {
  Widget displayedInfo = Container();

  void allpress() {
    setState(() {
      displayedInfo = all;
    });
  }

  void accessoires() {
    setState(() {
      displayedInfo = accessoiress;
    });
  }

  void carParts() {
    setState(() {
      displayedInfo = carparts;
    });
  }

  void carServices() {
    setState(() {
      displayedInfo = carservices;
    });
  }

  void other() {
    setState(() {
      displayedInfo = others;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kWalletAndSearchbarAndCart,
            categories,
            size,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: allpress,
                      child: const Text(
                        "All",
                        style: TextStyle(color: white),
                      )),
                  h,
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: accessoires,
                      child: const Text(
                        "Accessories",
                        style: TextStyle(color: white),
                      )),
                  h,
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: carParts,
                      child: const Text(
                        "Car parts",
                        style: TextStyle(color: white),
                      )),
                  h,
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: carServices,
                      child: const Text(
                        "Car services",
                        style: TextStyle(color: white),
                      )),
                  h,
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: other,
                      child: const Text(
                        "other",
                        style: TextStyle(color: white),
                      ))
                ],
              ),
            ),
            hSPACE,
            const Divider(),
            Center(child: displayedInfo)
          ],
        ),
      )),
    );
  }
}
