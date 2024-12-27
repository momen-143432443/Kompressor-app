import 'package:ecar/Frontend/Screens/generalPages/ExplorerTriggers/KWallet.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

class EShop extends StatefulWidget {
  const EShop({super.key});

  @override
  State<EShop> createState() => _EShopState();
}

class _EShopState extends State<EShop> {
  Widget displayedInfo = Container();

  void allpress() {
    setState(() {
      displayedInfo = SingleChildScrollView(
        child: Column(
          children: [
            MostSales(),
            Card(
              color: redColor,
              child: Text('ALL'),
            ),
            ThingMayYouLike()
          ],
        ),
      );
    });
  }

  void accessoires() {
    setState(() {
      displayedInfo = Column(
        children: [
          Card(
            color: blueColor,
            child: Text('acccessoires'),
          )
        ],
      );
    });
  }

  void carParts() {
    setState(() {
      displayedInfo = Column(
        children: [
          Card(
            color: blueColor,
            child: Text('acccessoires'),
          )
        ],
      );
    });
  }

  void carServices() {
    setState(() {
      displayedInfo = Column(
        children: [
          Card(
            color: orange,
            child: Text('car service'),
          )
        ],
      );
    });
  }

  void other() {
    setState(() {
      displayedInfo = Column(
        children: [
          Card(
            color: orange,
            child: Text('car service'),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            KWalletAndSearchbarAndCart(),
            Categories(),
            size,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  eshopAll(),
                  h,
                  eshopAccessoires(),
                  h,
                  eshopCarParts(),
                  h,
                  eshopCarService(),
                  h,
                  eshopOther()
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

  ElevatedButton eshopOther() {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: other,
        child: const Text(
          "other",
          style: TextStyle(color: white),
        ));
  }

  ElevatedButton eshopCarService() {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: carServices,
        child: const Text(
          "Car services",
          style: TextStyle(color: white),
        ));
  }

  ElevatedButton eshopCarParts() {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: carParts,
        child: const Text(
          "Car parts",
          style: TextStyle(color: white),
        ));
  }

  ElevatedButton eshopAccessoires() {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: accessoires,
        child: const Text(
          "Accessories",
          style: TextStyle(color: white),
        ));
  }

  ElevatedButton eshopAll() {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(blueColor)),
        onPressed: allpress,
        child: const Text(
          "All",
          style: TextStyle(color: white),
        ));
  }
}

class ThingMayYouLike extends StatelessWidget {
  const ThingMayYouLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 290),
      child: Text('Things may you like',
          style: GoogleFonts.jua(color: grey, fontSize: 13)),
    );
  }
}

class MostSales extends StatelessWidget {
  const MostSales({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 295),
      child: Text('Most sales!',
          style: GoogleFonts.jua(color: grey, fontSize: 20)),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 295),
      child: Text(
        'Categories',
        style: GoogleFonts.jua(color: grey),
      ),
    );
  }
}

class KWalletAndSearchbarAndCart extends StatelessWidget {
  const KWalletAndSearchbarAndCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const KWallet()),
          child: Stack(children: [
            Text(
              'K',
              style: GoogleFonts.jua(fontSize: 25, color: blueColor),
            ),
            Transform.rotate(
              angle: math.pi / 9,
              child: Text(
                "Wallet",
                style: GoogleFonts.jua(fontSize: 12, color: grey),
              ),
            )
          ]),
        ),
        Container(
          width: widthOfButton.width / 1.45,
          margin: veAho,
          child: CupertinoSearchTextField(
            onSuffixTap: () {},
            suffixIcon: const Icon(Icons.clear),
            enableIMEPersonalizedLearning: true,
            onChanged: (value) {},
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const Icon(Iconsax.shop_add),
      ],
    );
  }
}
