import 'package:ecar/Backend/CarStructure/car_repository.dart';
import 'package:ecar/Backend/carNotes.dart/notesRepository.dart';
import 'package:ecar/Backend/features/snacks.dart';
import 'package:ecar/Backend/for_User/user_respository.dart';
import 'package:ecar/Frontend/Login&Signup&Logout/signIn.dart';
import 'package:ecar/Frontend/Screens/editorialPages/editorialPage.dart';
import 'package:ecar/main.dart';
import 'package:ecar/navigationBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRespository extends GetxController {
  static AuthenticationRespository get instance => Get.find();

  //Variables
  final auth = FirebaseAuth.instance;
  final getStorage = GetStorage();

  // Getters
  User? get authUser => auth.currentUser;

  @override
  void onReady() {
    print(auth.currentUser?.email);
    screenRediect();
  }

  void screenRediect() async {
    final user = auth.currentUser;
    if (kDebugMode) {
      print('=================Get Storage Auth repo====================');
      print(getStorage.read('IsFirstTime'));
    }
    getStorage.writeIfNull('IsFirstTime', true);
    getStorage.read('IsFirstTime') != true
        ? navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SignIn(),
            ),
            (route) => false)
        : Get.offAll(() => const EditorialPage());

    if (user != null) {
      // If the user login , go to the navibar, if not,go to th sign
      await navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const NaviBar()),
          (route) => false);
    } else {
      Get.offAll(() => const SignIn());
    }
    print(auth.currentUser?.email);
  }

  //_____________________________________________________________[Login & signup]___________________________________________________________

  //Email authentication -sign in

  Future<UserCredential> loginEmailAndPasswordUser(
      String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('==========================================================');
      print(e.toString());
      print('==========================================================');
      throw exceptions(e.message.toString());
    } catch (err) {
      throw 'Something went wrong, please try later';
    }
  }

  ///Email authentication -sign Up
  Future<UserCredential> createEmailAndPasswordUser(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw exceptions(e.message.toString());
    }
  }

  ///Email authentication -Forget password
  Future<void> forgetPasswordEmailUser(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw exceptions(e.message.toString());
    } catch (err) {
      throw 'Somthing went wrong, please try later';
    }
  }

  // Re-authentication
  Future<void> reAuthentication(String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw exceptions(e.message.toString());
    } on PlatformException catch (e) {
      throw exceptions(e.message.toString());
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    } catch (e) {
      throw 'Somthing went wrong, please try later';
    }
  }

  //Delete Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(auth.currentUser!.uid);
      await CarsRepository.instance.removeCarRecords(auth.currentUser!.uid);
      await Notesrepository.instance.removeNoteRecords(auth.currentUser!.uid);
      await auth.currentUser?.delete();
    } on FirebaseException catch (e) {
      throw exceptions(e.message.toString());
    } on PlatformException catch (err) {
      throw exceptions(err.message.toString());
    } catch (e) {
      throw 'Something went wrong';
    }
  }
  //*-------------------------------------*//
  //         Sign up with google

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw exceptions(e.message.toString());
    }
  }

// Future<UserCredential?> signUpWithGoogle() async {
//     try {
//       // Trigger the authentication flow
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       // Create a new credential
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       return await FirebaseAuth.instance.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       throw exceptions(e.message.toString());
//     }
//   }

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await auth.signOut();
  }
}