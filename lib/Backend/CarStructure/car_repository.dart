import 'dart:io';

import 'package:ecar/Backend/CarStructure/CarModel.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class CarsRepository extends GetxController {
  static CarsRepository get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<void> saveCarRecords(CarsModel car) async {
    try {
      await db
          .collection('Cars')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set(car.toJson());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  //Fetch user data based on user ID
  Future<CarsModel> fetchCarRecords() async {
    try {
      final document = await db
          .collection("Cars")
          .doc(AuthenticationRespository.instance.authUser?.uid)
          .get();
      if (document.exists) {
        return CarsModel.fromSnapshot(document);
      } else {
        return CarsModel.carsModelempty();
      }
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> updateSpecificCarData(Map<String, dynamic> json) async {
    try {
      await db
          .collection("Cars")
          .doc(AuthenticationRespository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      Get.snackbar('errr', e.toString());
    }
  }

  Future<void> removeCarRecords(String userId) async {
    try {
      await db.collection("Cars").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  // Upload images
  Future<String> uploadImageCar(String path, XFile images) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(images.name);
      await ref.putFile(File(images.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      print('======================================================');
      throw Get.snackbar('Error', e.message.toString());
    } on PlatformException catch (e) {
      print('..............................................................');
      throw Get.snackbar('Error', e.message.toString());
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
