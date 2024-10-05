import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsApi {
  // Create an instance of firebase messaging
  final firebaseMessge = FirebaseMessaging.instance;
  //Function to initialize notifications
  Future<void> initNoti() async {
    //request permission form user
    await firebaseMessge.requestPermission();
    //Fetch the Fcm token for this deveice
    final FCM = await firebaseMessge.getToken();
    print(FCM.toString());
  }
}
