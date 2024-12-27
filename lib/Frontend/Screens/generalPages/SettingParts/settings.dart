import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Frontend/Login&Signup&Logout/SignIn.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/Language.dart';
import 'package:ecar/Frontend/Screens/generalPages/SettingParts/MyActivties.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uicons/uicons.dart';

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
              SettingText(),
              hSPACE,
              ///////////////////
              ///==For user==///
              /////////////////
              ForUserText(),
              UserActivities(),
              hSpacE,
              EmailNotifications(),
              hSpacE,
              Divider(height: h2.height),
              spc(h2.height!),
              h2,
              /////////////////
              ///==Device==///
              ///////////////
              DeviceText(),
              AppLanguage(),
              hSpacE,
              DevicePermission(),
              hSpacE,
              spc(h2.height!),
              h2,
              ///////////////////////////////
              ///==protectionAndSupport==///
              /////////////////////////////
              ProtectionAndSupportText(),
              PrivacyAndSecurity(),
              hSpacE,
              ReportCenter(),
              hSpacE,
              About(),
              hSpacE,
              spc(h2.height!),
              h2,
              /////////////////
              ///==Login==////
              ////////////////
              AccountText(),
              Logout(),
              hSpacE,
              DeleteAccount()
            ],
          ),
        ),
      )),
    );
  }
}

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.deleteAccountWearing(),
      child: Row(
        children: [
          const Icon(Iconsax.profile_delete, color: redColor),
          width2,
          const Text('Delete account', style: TextStyle(color: redColor))
        ],
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthenticationRespository.instance.logout();
        Get.offAll(() => const SignIn());
      },
      child: Row(
        children: [
          const Icon(
            Iconsax.logout,
            color: redColor,
          ),
          width2,
          const Text(
            'Sign out',
            style: TextStyle(color: redColor),
          )
        ],
      ),
    );
  }
}

class AccountText extends StatelessWidget {
  const AccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Account', style: GoogleFonts.aleo(fontSize: 15, color: black));
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: black,
          ),
          width2,
          const Text(
            'About',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class ReportCenter extends StatelessWidget {
  const ReportCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.help_outline_outlined,
            color: black,
          ),
          width2,
          const Text(
            'Report center',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class PrivacyAndSecurity extends StatelessWidget {
  const PrivacyAndSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Iconsax.security,
            color: black,
          ),
          width2,
          const Text(
            'Praivcy and Security',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class ProtectionAndSupportText extends StatelessWidget {
  const ProtectionAndSupportText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Protection and support',
        style: GoogleFonts.aleo(fontSize: 15, color: black));
  }
}

class DevicePermission extends StatelessWidget {
  const DevicePermission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(
            Icons.phone_iphone_outlined,
            color: black,
          ),
          width2,
          const Text(
            'Device permission',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class AppLanguage extends StatelessWidget {
  const AppLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const Language()),
      child: Row(
        children: [
          const Icon(
            Iconsax.language_square,
            color: black,
          ),
          width2,
          const Text(
            'Language',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class DeviceText extends StatelessWidget {
  const DeviceText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Device', style: GoogleFonts.aleo(fontSize: 15, color: black));
  }
}

class EmailNotifications extends StatelessWidget {
  const EmailNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Stack(children: [
            const Icon(
              Iconsax.notification_1,
              color: black,
            ),
            Positioned(
              top: 6,
              right: 5,
              child: Icon(
                UIcons.regularRounded.e,
                color: black,
                size: 10,
              ),
            ),
          ]),
          width2,
          const Text(
            'Email notification',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class UserActivities extends StatelessWidget {
  const UserActivities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const MyActivities()),
      child: Row(
        children: [
          const Icon(
            Iconsax.activity,
            color: black,
          ),
          width2,
          const Text(
            'My activities',
            style: TextStyle(color: black),
          )
        ],
      ),
    );
  }
}

class ForUserText extends StatelessWidget {
  const ForUserText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('For user',
        style: GoogleFonts.aleo(fontSize: 15, color: black));
  }
}

class SettingText extends StatelessWidget {
  const SettingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Text('Settings', style: GoogleFonts.aleo(fontSize: 23, color: black)),
        Icon(
          Iconsax.backward,
          color: Colors.transparent,
        )
      ],
    );
  }
}
