// ignore_for_file: unrelated_type_equality_checks
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:ecar/Backend/for_User/ProfileController.dart';
import 'package:ecar/Backend/Features/fullScreenLoader.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:ecar/main.dart';
import 'package:ecar/tools/navigationBar.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final userController = Get.put(ProfileController());

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel.usersModelempty().obs;
  final localStorage = GetStorage();
  final remeberMe = false.obs;
  final hidePassword = true.obs;

  @override
  void onInit() {
    email.text = localStorage.read('Remember_me_Email') ?? '';
    password.text = localStorage.read('Remember_me_Password') ?? '';
    super.onInit();
  }

  final isLoader = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;
  final userController = Get.put(ProfileController());

  Future<void> signIn() async {
    if (email.text.isEmpty && password.text.isNotEmpty) {
      theEmailIsRequired();
    } else if (email.text.isNotEmpty && password.text.isEmpty) {
      thePasswordIsRequired();
    } else if (email.text.isEmpty && password.text.isEmpty) {
      allFieldsAreRequired();
    } else if (email.text.trim() !=
            userController.userRepo.db.collection('Users').doc('Email') &&
        password.text.trim() ==
            userController.userRepo.db.collection('Users').doc('Password')) {
      emailIsIncorrect();
    } else if (email.text.trim() ==
            userController.userRepo.db.collection('Users').doc('Email') &&
        password.text.trim() !=
            userController.userRepo.db.collection('Users').doc('Paswword')) {
      passwordIsIncorect();
    } else if (email.text.isNotEmpty && password.text.isNotEmpty ||
        (email.text.trim() ==
                userController.userRepo.db
                    .collection('Users')
                    .where('Email', isEqualTo: user.value.email) &&
            password.text.trim() ==
                userController.userRepo.db
                    .collection('Users')
                    .where('Password', isEqualTo: user.value.password))) {
      try {
        // Start loading
        Fullscreenloader.openLoadingDialog();

        if (remeberMe.value) {
          localStorage.write('Remember_me_Email', email.text.trim());
          localStorage.write('Remember_me_Password', password.text.trim());
        }
        if (!remeberMe.value) {
          localStorage.write('Remember_me_Email', null);
          localStorage.write('Remember_me_Password', null);
        }
        await AuthenticationRespository.instance
            .loginEmailAndPasswordUser(email.text.trim(), password.text.trim());

        Fullscreenloader.stopLoading();
        await navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const NaviBar()),
            (route) => false);
        throw loginSuccess();
      } on FirebaseAuthException catch (e) {
        exceptions(e.message.toString());
      } on FirebaseException catch (e) {
        exceptions(e.message.toString());
      } on PlatformException catch (e) {
        exceptions(e.message.toString());
      } catch (e) {
        print('$e');
      } finally {
        Fullscreenloader.stopLoading();
      }
    } else {
      Get.snackbar('Error', "There's some requireds empty.",
          colorText: white,
          backgroundColor: redColor,
          icon: const Icon(Icons.error));
    }
  }

  Future<void> googleSignIn() async {
    final auth = AuthenticationRespository.instance;
    final pro =
        auth.auth.currentUser?.providerData.map((e) => e.providerId).first;
    try {
      if (pro!.isEmpty) {
        return signUpFirst();
      } else if (pro.isNotEmpty) {
        if (pro == 'google.com') {
          await auth.signInWithGoogle();
          auth.screenRediect();
        }
      }
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-foun') {
        return signUpFirst();
      }
    }
  }
}
