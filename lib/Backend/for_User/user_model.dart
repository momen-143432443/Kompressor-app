import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String? fullName;
  final String email;
  final String password;
  final String phone;
  final String userPic;

  const UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.userPic,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Phone": phone,
      "UserPicture": userPic,
    };
  }

  String get fullname => '$fullName';
  static List<String?> nameParts(fullname) => fullname.split(" ");

  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String userWithPrefix = "cwt_$camelCaseUsername";
    return userWithPrefix;
  }

  static UserModel usersModelempty() => const UserModel(
      id: '', fullName: '', email: '', password: '', phone: '', userPic: '');

  //Map user fetched from firebase to user model

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return UserModel(
          id: documentSnapshot.id,
          fullName: data["FullName"] ?? '',
          email: data["Email"] ?? '',
          password: data["Password"] ?? '',
          phone: data["Phone"] ?? '',
          userPic: data["UserPicture"] ?? '');
    } else {
      return UserModel.usersModelempty();
    }
  }
}
