import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class TelephonePage extends StatefulWidget {
  const TelephonePage({super.key});

  @override
  State<TelephonePage> createState() => _TelephonePageState();
}

class _TelephonePageState extends State<TelephonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            telephoneBack,
            hSPACE,
            phoneText,
            hSpacE,
            forCustomerService,
            contactReception,
            const Divider(),
            chatText,
            hSpacE,
            chatLiveButton,
            sendChatReport,
            const Divider(),
            helpText,
            helpCenterButton,
            aboutAppButton,
            const Divider(),
            suggestText,
            suggestTextField,
            suggestButton
          ],
        ),
      )),
    );
  }
}
