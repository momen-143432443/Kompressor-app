import 'dart:io';

import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Store user in Firebase
  Future<void> saveUserRecords(UserModel user) async {
    try {
      await db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  //Fetch user data based on user ID
  Future<UserModel> fetchUserRecords() async {
    try {
      final document = await db
          .collection("Users")
          .doc(AuthenticationRespository.instance.authUser?.uid)
          .get();
      if (document.exists) {
        return UserModel.fromSnapshot(document);
      } else {
        return UserModel.usersModelempty();
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  // Update user data based on user ID
  Future<void> updateDataUser(UserModel updadeUser) async {
    try {
      await db
          .collection("Users")
          .doc(updadeUser.id)
          .update(updadeUser.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  // Update any field user data
  Future<void> updateSpecificData(Map<String, dynamic> json) async {
    try {
      await db
          .collection("Users")
          .doc(AuthenticationRespository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  // Remove user data
  Future<void> removeUserRecord(String userId) async {
    try {
      await db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  // Function to save user data
  Future<void> saveUserRecord(UserModel? user) async {
    try {
      await db.collection("Users").doc(user?.id).set(user!.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', '$e');
    }
  }

// Upload images
  Future<String> uploadImageUser(String path, XFile images) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(images.name);
      await ref.putFile(File(images.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw Get.snackbar('Error', e.message.toString());
    } on PlatformException catch (e) {
      throw Get.snackbar('Error', e.message.toString());
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
