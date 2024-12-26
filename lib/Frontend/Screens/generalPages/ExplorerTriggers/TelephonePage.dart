import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
            TelephoneBack(),
            hSPACE,
            PhoneText(),
            hSpacE,
            ForCustomerService(),
            ContactReception(),
            div,
            ChatText(),
            hSpacE,
            ChatLiveButton(),
            SendChatReport(),
            div,
            HelpText(),
            HelpCenterButton(),
            AboutAppButton(),
            div,
            SuggestText(),
            SuggestTextField(),
            SuggestButton()
          ],
        ),
      )),
    );
  }
}

class SuggestButton extends StatelessWidget {
  const SuggestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOfButton.width / 1.2,
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(blueColor)),
          onPressed: () {},
          child: const Text(
            'Submit',
            style: TextStyle(color: white),
          )),
    );
  }
}

class SuggestTextField extends StatelessWidget {
  const SuggestTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          maxLines: 7,
          maxLength: 600,
          // controller: carController.carMake,
          cursorRadius: const Radius.circular(3),
          autocorrect: true,
          enableInteractiveSelection: true,
          cursorColor: Colors.white,
          style: const TextStyle(color: black),
          decoration: InputDecoration(
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

class SuggestText extends StatelessWidget {
  const SuggestText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'If you have any advies and suggestes, please drop it\n inside the text field, and we will fulfill your needs',
        style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
      ),
    );
  }
}

class AboutAppButton extends StatelessWidget {
  const AboutAppButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'About the app',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  'View',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class HelpCenterButton extends StatelessWidget {
  const HelpCenterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Help center',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  'Help',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class HelpText extends StatelessWidget {
  const HelpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Help?"),
    );
  }
}

class SendChatReport extends StatelessWidget {
  const SendChatReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Send chat Reports',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  'Send',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class ChatLiveButton extends StatelessWidget {
  const ChatLiveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Chat live, with chat agent',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  'Start chating',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class ChatText extends StatelessWidget {
  const ChatText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Chat"),
    );
  }
}

class ContactReception extends StatelessWidget {
  const ContactReception({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Contact with the Reception',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  '+962790005',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class ForCustomerService extends StatelessWidget {
  const ForCustomerService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appSym,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'For customer service',
            style: GoogleFonts.aleo(fontWeight: FontWeight.w500, color: black),
          ),
          SizedBox(
            width: widthOfButton.width / 3,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(blueColor)),
                onPressed: () {},
                child: const Text(
                  '+962790006',
                  style: TextStyle(color: white),
                )),
          )
        ],
      ),
    );
  }
}

class PhoneText extends StatelessWidget {
  const PhoneText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Phones"),
    );
  }
}

class TelephoneBack extends StatelessWidget {
  const TelephoneBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.backward)),
        Text(
          'Telephones & customer care',
          style: GoogleFonts.aleo(
              fontWeight: FontWeight.w500, fontSize: 23, color: black),
        )
      ],
    );
  }
}
