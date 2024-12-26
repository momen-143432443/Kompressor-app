import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/tools/fullScreenLoader.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:ecar/Backend/for_User/SignUpController.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:ecar/Backend/for_User/user_respository.dart';

import 'package:ecar/Frontend/Login&Signup&Logout/signIn.dart';
import 'package:ecar/Frontend/Screens/generalPages/reAuthPage.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get instanse => Get.find();
  final auth = AuthenticationRespository.instance.authUser;
  Rx<UserModel> user = UserModel.usersModelempty().obs;
  GlobalKey<FormState> homeFormKey = GlobalKey<FormState>();
  final userRepo = Get.put(UserRepository());
  final verfiyEmail = TextEditingController();
  final verfiyPassword = TextEditingController();
  final hidePassword = true.obs;
  final controller = Get.put(SignUpController());

  @override
  void onInit() {
    super.onInit(); // Call super if required by the library
    fetchUserRecord();
  }

  Future<UserModel> fetchUserRecord() async {
    return await userRepo.fetchUserRecords();
  }

  // Save user record from ang Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // Refresh receords
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert name to first name and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');

          final user = UserModel(
              id: userCredentials.user!.uid,
              fullName: nameParts[0],
              email: userCredentials.user!.email ?? '',
              password: '',
              phone: userCredentials.user!.phoneNumber ?? '',
              userPic: userCredentials.user!.photoURL ?? '');

          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  /// Delete account wearing
  void deleteAccountWearing() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(23),
        title: 'Delete account',
        middleText:
            "Are you sure you want to delete your account premanetly? This action isn't reversible  and all of your data will be removed premanetly.",
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: redColor,
                side: const BorderSide(color: redColor)),
            onPressed: () async => deleteUserAccount(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Delete', style: TextStyle(color: white)),
            )),
        cancel: OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: black))));
  }

  void deleteUserAccount() async {
    try {
      Fullscreenloader.openLoadingDialog();
      final reAuth = AuthenticationRespository.instance;
      final provider =
          reAuth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        //Re Verfiy Auth email
        if (provider == 'google.com') {
          await reAuth.signInWithGoogle();
          await reAuth.deleteAccount();
          Fullscreenloader.stopLoading();
          Get.offAll(() => const SignIn());
        } else if (provider == 'password') {
          Fullscreenloader.stopLoading();
          Get.off(() => const Reauthpage());
        }
      }
    } catch (e) {
      Fullscreenloader.stopLoading();
      exceptions(e.toString());
    }
  }

  Future<void> reAuthenticationEmailAndPassword() async {
    try {
      Fullscreenloader.openLoadingDialog();

      await AuthenticationRespository.instance.reAuthentication(
          verfiyEmail.text.trim(), verfiyPassword.text.trim());
      await AuthenticationRespository.instance.deleteAccount();
      Fullscreenloader.stopLoading();
      Get.offAll(() => const SignIn());
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-email':
          message = 'The email address is invalid.';
          break;
        case 'user-disabled':
          message = 'The user account has been disabled.';
          break;
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Wrong password provided for that user.';
          break;
        case 'expired-action-code':
          message = 'The action code has expired. Please try again.';
          break;
        case 'invalid-action-code':
          message = 'The action code is invalid. Please try again.';
          break;
        case 'wrong-password':
          message = 'The password is incorrect.';
          break;
        case 'credential-already-in-use':
          message = 'The account already exists with this email.';
          break;
        default:
          message = 'An unknown error occurred. Please try again.';
      }
      showSnackbar(message);
    } on PlatformException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  //////Upload profile pic
  uploadProfilePic() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        final imageURL =
            await userRepo.uploadImageUser('Users/Images/Profile', image);
        //Update User Image record
        Map<String, dynamic> json = {'UserPicture': imageURL};
        await userRepo.updateSpecificData(json);
        user.value.userPic;

        Get.snackbar('Done!', 'Update image successfully',
            animationDuration: const Duration(seconds: 2),
            colorText: white,
            backgroundColor: green,
            icon: const Icon(Icons.done));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          animationDuration: const Duration(seconds: 2),
          colorText: white,
          backgroundColor: redColor,
          icon: const Icon(Icons.error));
    }
  }
}
