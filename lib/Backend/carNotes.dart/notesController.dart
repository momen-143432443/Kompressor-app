import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecar/Backend/Features/fullScreenLoader.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/carNotes.dart/notesModel.dart';
import 'package:ecar/Backend/carNotes.dart/notesRepository.dart';
import 'package:ecar/tools/snacks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Notescontroller extends GetxController {
  static Notescontroller get instance => Get.find();
  final auth = FirebaseAuth.instance;
  final subjectText = TextEditingController();
  final titleText = TextEditingController();
  final date = DateTime.now().millisecondsSinceEpoch;
  Rx<NotesModel> note = NotesModel.notesEmpty().obs;
  final noteRepo = Get.put(Notesrepository());

  @override
  void onInit() {
    super.onInit(); // Call super if required by the library
    getAllNotes();
  }

  Future<List<NotesModel>> getAllNotes() async {
    return await noteRepo.fetchAllNotes();
  }

  Future<void> storeNotesData() async {
    if (subjectText.text.isEmpty && titleText.text.isEmpty) {
      titleAndSubjectRequired();
    } else if (subjectText.text.isNotEmpty && titleText.text.isEmpty) {
      titleField();
    } else if (subjectText.text.isEmpty && titleText.text.isNotEmpty) {
      subjectField();
    }
    if (subjectText.text.isNotEmpty && titleText.text.isNotEmpty) {
      try {
        Fullscreenloader.openLoadingDialog();
        final notes = NotesModel(
            docId: FirebaseFirestore.instance.collection('Car Notes').doc().id,
            id: AuthenticationRespository.instance.authUser!.uid,
            email: AuthenticationRespository.instance.authUser?.email,
            subject: subjectText.text.trim(),
            title: titleText.text.trim(),
            timePost: Timestamp.now());

        final notesRepo = Get.put(Notesrepository());
        await notesRepo.saveNotesRecord(notes);
        Fullscreenloader.stopLoading();
        Get.back();
        throw noteCreated();
      } on FirebaseException catch (e) {
        print(e.toString());
      } on PlatformException catch (e) {
        print(e.toString());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> deleteSpecificNote(String? id) async {
    try {
      Fullscreenloader.openLoadingDialog();
      await noteRepo.removeNoteRecords(id!);
      Fullscreenloader.stopLoading();
    } on FirebaseException catch (e) {
      print(e.toString());
      Fullscreenloader.stopLoading();
      exceptions(e.toString());
    } on PlatformException catch (e) {
      // print(e.toString());
      Fullscreenloader.stopLoading();
      exceptions(e.toString());
    } catch (e) {
      print(e.toString());
      Fullscreenloader.stopLoading();
    }
  }

  Future<void> deleteSomeNotes(String id) async {
    try {
      Fullscreenloader.openLoadingDialog();
      await noteRepo.deleteSpecificNote(id);
      Fullscreenloader.stopLoading();
      deleteSuccess();
    } on PlatformException catch (e) {
      exceptions(e.message.toString());
    } catch (e) {
      throw e.toString();
    }
  }
}
