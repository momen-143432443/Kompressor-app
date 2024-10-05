import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              settingText,
              hSPACE,
              ///////////////////
              ///==For user==///
              /////////////////
              forUserText,
              myActivities,
              hSpacE,
              emailNotifications,
              hSpacE,
              Divider(height: h2.height),
              h2,
              /////////////////
              ///==Device==///
              ///////////////
              deviceText,
              language,
              hSpacE,
              devicePermission,
              hSpacE,
              Divider(height: h2.height),
              h2,
              ///////////////////////////////
              ///==protectionAndSupport==///
              /////////////////////////////
              protectionAndSupportText,
              privacyAndSecurity,
              hSpacE,
              reportCenter,
              hSpacE,
              about,
              hSpacE,
              Divider(height: h2.height),
              h2,
              /////////////////
              ///==Login==////
              ////////////////
              accountText,
              logout,
              hSpacE,
              deleteAccount
            ],
          ),
        ),
      )),
    );
  }
}
