import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Notesrepository extends GetxController {
  static Notesrepository get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<void> saveNotesRecord(NotesModel note) async {
    try {
      AuthenticationRespository.instance.authUser?.uid;
      await db.collection('Car Notes').add(note.toJson());
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor.withOpacity(0.1),
      );
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor.withOpacity(0.1),
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor.withOpacity(0.1),
      );
    }
  }

  Future<List<NotesModel>> fetchAllNotes() async {
    final snapshot = await db
        .collection('Car Notes')
        .where('ID',
            isEqualTo: AuthenticationRespository.instance.authUser?.uid)
        .get();
    final userData =
        snapshot.docs.map((e) => NotesModel.fromNotesSnaphot(e)).toList();
    return userData;
  }

  Future<void> removeNoteRecords(String noteId) async {
    try {
      await db.collection("Car Notes").doc(noteId).delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> deleteSpecificNote(String id) async {
    try {
      await db.collection('Car Notes').doc(id).delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong, please try again';
    }
  }
}
