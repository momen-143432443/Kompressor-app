import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

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
              wallet,
              hSPACE,
              balanceInWallet(),
              div,
              historyOfWallet
            ],
          ),
        ),
      )),
    );
  }
}
