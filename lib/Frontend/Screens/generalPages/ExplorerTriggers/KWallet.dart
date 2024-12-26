import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class KWallet extends StatefulWidget {
  const KWallet({super.key});

  @override
  State<KWallet> createState() => _KWalletState();
}

class _KWalletState extends State<KWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              hSpacE,
              Wallet(),
              hSPACE,
              BalanceInWallet(),
              div,
              HistoryOfWallet()
            ],
          ),
        ),
      )),
    );
  }
}

class HistoryOfWallet extends StatelessWidget {
  const HistoryOfWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Text('History of using the wallet',
          style: GoogleFonts.aleo(
              fontWeight: FontWeight.w500, fontSize: 23, color: black)),
    );
  }
}

class BalanceInWallet extends StatelessWidget {
  const BalanceInWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfButton.width / 1.3,
      height: widthOfButton.height / 7 + 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: carGrey),
      child: Padding(
        padding: appSym,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Balance',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                  Text('344 JOD',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Points',
                      style: GoogleFonts.jua(fontSize: 20, color: white)),
                  Text('2222 points',
                      style: GoogleFonts.jua(fontSize: 20, color: white))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: widthOfButton.width / 4,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: () {},
                      child: const Text('Request',
                          style: TextStyle(color: white))),
                ),
                SizedBox(
                  width: widthOfButton.width / 4,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(blueColor)),
                      onPressed: () {},
                      child:
                          const Text('Send', style: TextStyle(color: white))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Wallet',
              style: GoogleFonts.aleo(
                  fontWeight: FontWeight.w500, fontSize: 23, color: black)),
          PopupMenuButton<String>(
              offset: const Offset(22, 34),
              color: blueColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'Deposit',
                    child: Text('Deposit', style: TextStyle(color: white)),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Withdraw',
                    child: Text('Withdraw', style: TextStyle(color: white)),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Help',
                    child: Text('Help', style: TextStyle(color: white)),
                  ),
                ];
              },
              child: const Icon(
                Iconsax.more_2,
                color: blueColor,
              ))
        ],
      ),
    );
  }
}
