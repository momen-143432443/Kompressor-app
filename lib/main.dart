import 'dart:io';
import 'package:ecar/Backend/authenticationRespository/authenticationRespository.dart';
import 'package:ecar/Backend/generalBindings.dart';
import 'package:ecar/Backend/notifications/notificationsApi.dart';
import 'package:ecar/Frontend/Screens/editorialPages/editorialPage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final authController = AuthenticationRespository();
void main() async {
  // final WidgetsBinding widgetBinding =
  WidgetsFlutterBinding.ensureInitialized();

  //initialize getx storage
  await GetStorage.init();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCQHjOhWRx28mGcbqsTeFGuVvlu5LDdm2w',
      appId: "1:495016700131:android:75452b07c4c71950977dd6",
      messagingSenderId: '495016700131',
      projectId: 'kompressor-e176f',
      storageBucket: "kompressor-e176f.appspot.com",
    ));
    await NotificationsApi().initNoti();
  }
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCQHjOhWRx28mGcbqsTeFGuVvlu5LDdm2w',
            appId: "1:495016700131:android:75452b07c4c71950977dd6",
            messagingSenderId: '495016700131',
            projectId: 'kompressor-e176f',
            iosBundleId: 'com.example.ecar',
            storageBucket: 'kompressor-e176f.appspot.com'));
  }

  await Firebase.initializeApp()
      .then((value) => Get.put(AuthenticationRespository()));

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
    // appleProvider: AppleProvider.deviceCheck
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey: navigatorKey,
        initialBinding: Generalbindings(),
        debugShowCheckedModeBanner: false,
        title: 'Kompressor',
        home: const EditorialPage());
  }
}
