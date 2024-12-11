import 'package:ecar/Backend/Features/fullScreenLoader.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:ecar/Backend/for_User/LoginController.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:ecar/Backend/for_User/user_respository.dart';
import 'package:ecar/Frontend/Login&Signup&Logout/signUpUploadImage.dart';
import 'package:ecar/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Text field controllers to get data from text field
  final hidePassword = true.obs;
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNum = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (fullName.text.isEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phoneNum.text.isNotEmpty) {
      // ======if the fullname is null
      print('theFullnameIsRequired');
      theFullnameIsRequired();
      ///////////////////////////////
    } else if (fullName.text.isNotEmpty &&
        email.text.isEmpty &&
        password.text.isNotEmpty &&
        phoneNum.text.isNotEmpty) {
      // ======if the email is null
      theEmailIsRequired();
      //////////////////////////////
    } else if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isEmpty &&
        phoneNum.text.isNotEmpty) {
      // ======if the password is null
      thePasswordIsRequired();
      /////////////////////////////
    } else if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phoneNum.text.isEmpty) {
      // ======if the phone number is null
      thePhoneNumberIsrequired();
      ///////////////////////////
    } else if (fullName.text.isEmpty &&
        email.text.isEmpty &&
        password.text.isEmpty &&
        phoneNum.text.isEmpty) {
      // ======if all fields are null
      allFieldsAreRequired();
      //////////////////////////
    } else if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phoneNum.text.isNotEmpty &&
        fullName.text.length > 12) {
      nameFieldLenght();
    } else if (fullName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phoneNum.text.isNotEmpty &&
        fullName.text.length < 12) {
      try {
        // Start loading
        Fullscreenloader.openLoadingDialog();
        final auth = await AuthenticationRespository.instance
            .createEmailAndPasswordUser(
                email.text.trim(), password.text.trim());
        final user = UserModel(
            id: auth.user!.uid,
            fullName: fullName.text.trim(),
            email: email.text.trim(),
            password: password.text.trim(),
            phone: phoneNum.text.trim(),
            userPic: '');

        final userRepo = Get.put(UserRepository());

        await userRepo.saveUserRecords(user);
        await navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Signupuploadimage()),
            (route) => false);
        Fullscreenloader.stopLoading();
        accountCreated();
      } on FirebaseAuthException catch (e) {
        exceptions(e.message.toString());
      } on FirebaseException catch (e) {
        exceptions(e.message.toString());
      } on PlatformException catch (e) {
        exceptions(e.message.toString());
      } catch (e) {
        print(e.toString());
      } finally {
        Fullscreenloader.stopLoading();
      }
    }
  }

  Future<void> googleSignUp() async {
    try {
      // isGoogleLoading.value = true;
      final auth = AuthenticationRespository.instance;
      await auth.signInWithGoogle();
      // isGoogleLoading.value = false;
      Get.off(() => const Signupuploadimage());
      final uC = await AuthenticationRespository.instance.signInWithGoogle();
      await userController.saveUserRecord(uC);
    } catch (e) {
      e.toString();
    }
  }
}
