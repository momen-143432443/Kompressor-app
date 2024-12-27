import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: signUpController.signUpKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: widthOfButton.height,
                child: Center(
                  child: Column(
                    children: [
                      Kom(),
                      FullnameTextField(),
                      h2,
                      EmailSignUpTextField(),
                      h2,
                      PasswordSignUpTextField(),
                      h2,
                      PhoneNum(),
                      hSpacE,
                      SignUpButton(),
                      w,
                      QuickRegister(),
                      w,
                      HelpCneter(),
                      BackToSignIn()
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

class BackToSignIn extends StatelessWidget {
  const BackToSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.back(),
        child: const Text(
          "Do you have an account, press to sign in",
          style: TextStyle(color: black),
        ));
  }
}

class HelpCneter extends StatelessWidget {
  const HelpCneter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.help_center_rounded,
          color: black,
        ),
        Text(
          "For the help center",
          style: TextStyle(color: black),
        ),
      ],
    );
  }
}

class QuickRegister extends StatelessWidget {
  const QuickRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "For quick registration",
          style: TextStyle(color: blueColor, fontSize: 12),
        ),
        h2,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuickSignIn().facebook,
            width2,
            GestureDetector(
                onTap: () async => await signUpController.googleSignUp(),
                child: QuickSignIn().google),
            width2,
            QuickSignIn().apple
          ],
        )
      ],
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
          onPressed: () async => await signUpController.signUp(),
          child: Text("Save and continue",
              style: GoogleFonts.balooDa2(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ))),
    );
  }
}

class PhoneNum extends StatelessWidget {
  const PhoneNum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.phoneNum,
      keyboardType: TextInputType.phone,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Iconsax.call, color: blueColor),
        labelText: 'Phone number',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class PasswordSignUpTextField extends StatelessWidget {
  const PasswordSignUpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.password,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      obscureText: controller.hidePassword.value,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () =>
                controller.hidePassword.value = !controller.hidePassword.value,
            icon: controller.hidePassword.value
                ? const Icon(
                    Iconsax.eye_slash,
                    color: blueColor,
                  )
                : const Icon(
                    Iconsax.eye,
                    color: blueColor,
                  )),
        labelText: 'Password',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class EmailSignUpTextField extends StatelessWidget {
  const EmailSignUpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.email,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.email, color: blueColor),
        labelText: 'Email',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class FullnameTextField extends StatelessWidget {
  const FullnameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpController.fullName,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.person, color: blueColor),
        labelText: 'Full name',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        // fillColor: const Color.fromARGB(255, 222, 222, 222),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class Kom extends StatelessWidget {
  const Kom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("K", style: GoogleFonts.jua(fontSize: 100, color: blueColor));
  }
}
