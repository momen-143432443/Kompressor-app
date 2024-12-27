import 'package:ecar/Backend/validator.dart';
import 'package:ecar/Frontend/Screens/generalPages/RsesndPasswordScreen.dart';
import 'package:ecar/Frontend/GerenalFunctions.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        key: loginController.loginFormKey,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(),
                child: Center(
                  child: Column(
                    children: [
                      K(),
                      hSpacE,
                      EmailSignInTextField(),
                      h2,
                      PasswordSignInTextField(),
                      RemeberMeAndForgetPassword(),
                      hSpacE,
                      LoginButton(),
                      QuickSign(),
                      HelpCenter(),
                      hSpacE,
                      YouDontHaveAnAccountPressToSignUp()
                    ],
                  ),
                )),
          ],
        ),
      )),
    );
  }
}

class YouDontHaveAnAccountPressToSignUp extends StatelessWidget {
  const YouDontHaveAnAccountPressToSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "You don't have an account, press to",
          style: TextStyle(color: black),
        ),
        TextButton(
            child: const Text(
              "sign up",
              style: TextStyle(color: black),
            ),
            onPressed: () => Get.to(() => const SignIn())),
      ],
    );
  }
}

class HelpCenter extends StatelessWidget {
  const HelpCenter({
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

class QuickSign extends StatelessWidget {
  const QuickSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "For quick sign",
          style: TextStyle(color: blueColor, fontSize: 12),
        ),
        h2,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuickSignIn().facebook,
            width2,
            GestureDetector(
                onTap: () async => await loginController.googleSignIn(),
                child: QuickSignIn().google),
            width2,
            QuickSignIn().apple
          ],
        )
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Color.fromARGB(255, 9, 78, 168))),
          onPressed: () async => await loginController.signIn(),
          child: Text("Save and continue",
              style: GoogleFonts.balooDa2(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ))),
    );
  }
}

class RemeberMeAndForgetPassword extends StatelessWidget {
  const RemeberMeAndForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Checkbox(
                      activeColor: green,
                      value: loginController.remeberMe.value,
                      onChanged: (value) {
                        loginController.remeberMe.value =
                            !loginController.remeberMe.value;
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "Remember me.",
                    style: TextStyle(color: black),
                  ),
                )
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.to(() => const ForgetPasswordscreen(
                email: '',
              )),
          child: Text("Forget password ?",
              style: GoogleFonts.balooDa2(
                color: blueColor,
                fontWeight: FontWeight.w800,
              )),
        ),
      ],
    );
  }
}

class PasswordSignInTextField extends StatelessWidget {
  const PasswordSignInTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.password,
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class EmailSignInTextField extends StatelessWidget {
  const EmailSignInTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.email,
      cursorRadius: const Radius.circular(3),
      autocorrect: true,
      enableInteractiveSelection: true,
      validator: (value) => ValidatorExe.validateEmail(value),
      cursorColor: Colors.white,
      style: const TextStyle(color: black),
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.email, color: blueColor),
        labelText: 'Email',
        labelStyle: const TextStyle(color: black),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      ),
    );
  }
}

class K extends StatelessWidget {
  const K({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("K", style: GoogleFonts.jua(fontSize: 100, color: blueColor));
  }
}
