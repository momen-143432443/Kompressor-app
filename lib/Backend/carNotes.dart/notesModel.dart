import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';

class NotesModel {
  final String docId;
  final String id;
  final String? email;
  final String subject;
  final String title;
  final Timestamp timePost;

  NotesModel(
      {required this.docId,
      required this.id,
      required this.email,
      required this.subject,
      required this.title,
      required this.timePost});

  Map<String, dynamic> toJson() {
    return {
      'Document ID': docId,
      'ID': AuthenticationRespository.instance.authUser?.uid,
      'Subject': subject,
      'Email': AuthenticationRespository.instance.authUser?.email,
      'Title': title,
      'TimePost': FieldValue.serverTimestamp()
    };
  }

  static NotesModel notesEmpty() => NotesModel(
      docId: '',
      id: '',
      subject: '',
      email: '',
      title: '',
      timePost: Timestamp.now());

  factory NotesModel.fromNotesSnaphot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return NotesModel(
          docId: documentSnapshot.id ?? '',
          id: data['ID'] ?? '',
          subject: data['Subject'] ?? '',
          email: data['Email'] ?? '',
          title: data['Title'] ?? '',
          timePost: data['TimePost'] as Timestamp);
    } else {
      return NotesModel.notesEmpty();
    }
  }
}
