import 'package:ecar/Backend/CarStructure/CarModel.dart';
import 'package:ecar/Backend/CarStructure/car_repository.dart';
import 'package:ecar/tools/fullScreenLoader.dart';
import 'package:ecar/Backend/for_User/user_model.dart';
import 'package:ecar/Frontend/Screens/CarInfoPages/carUploadImage.dart';
import 'package:ecar/main.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CarController extends GetxController {
  static CarController get instanse => Get.find();
  final carMake = TextEditingController();
  final carModel = TextEditingController();
  final carYear = TextEditingController();
  final carPic = '';
  final nameUrCar = TextEditingController();
  Rx<CarsModel> cars = CarsModel.carsModelempty().obs;
  Rx<UserModel> user = UserModel.usersModelempty().obs;
  GlobalKey<FormState> carDataKey = GlobalKey<FormState>();
  final carRepo = Get.put(CarsRepository());

  @override
  void onInit() {
    super.onInit(); // Call super if required by the library
    fetchCarRecord();
  }

  Future<CarsModel> fetchCarRecord() async {
    return await carRepo.fetchCarRecords();

    // try {
    //   return await carRepo.fetchCarRecords();
    //   // this.cars(cars);
    // } catch (e) {
    //   cars(CarsModel.carsModelempty());
    // }
  }

  Future<void> saveCarRecord(UserCredential? userCredentials) async {
    try {
      await fetchCarRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          const carsModel = CarsModel(
              carMake: '',
              carModel: '',
              carYear: '',
              carPic: '',
              nameYourCar: '');
          await carRepo.saveCarRecords(carsModel);
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateCarControl() async {
    Fullscreenloader.openLoadingDialog();

    Map<String, dynamic> carMakeJson = {
      "CarMake": carMake.text,
    };
    Map<String, dynamic> carModelJson = {
      "CarModel": carModel.text,
    };
    Map<String, dynamic> carYearJson = {
      "CarYear": carYear.text,
    };
    Map<String, dynamic> nameUrCarJson = {"NameYourCar": nameUrCar.text};

    if (carMake.text.isNotEmpty &&
        carModel.text.isEmpty &&
        carYear.text.isEmpty &&
        nameUrCar.text.isEmpty) {
      await carRepo.updateSpecificCarData(carMakeJson);

      ////////////
    } else if (carMake.text.isEmpty &&
        carModel.text.isNotEmpty &&
        carYear.text.isEmpty &&
        nameUrCar.text.isEmpty) {
      await carRepo.updateSpecificCarData(carModelJson);

      //////////////
    } else if (carMake.text.isEmpty &&
        carModel.text.isEmpty &&
        carYear.text.isNotEmpty &&
        nameUrCar.text.isEmpty) {
      await carRepo.updateSpecificCarData(carYearJson);

      ////////////////
    } else if (carMake.text.isEmpty &&
        carModel.text.isEmpty &&
        carYear.text.isEmpty &&
        nameUrCar.text.isNotEmpty) {
      await carRepo.updateSpecificCarData(nameUrCarJson);
    }
    Fullscreenloader.stopLoading();
    return navigator?.pop();
    //  return await carRepo.updateSpecificCarData(json);
  }

  Future<void> storeCarData() async {
    try {
      Fullscreenloader.openLoadingDialog();
      final cars = CarsModel(
          carMake: carMake.text.trim(),
          carModel: carModel.text.trim(),
          carYear: carYear.text.trim(),
          carPic: carPic,
          nameYourCar: nameUrCar.text.trim());
      final carRepo = Get.put(CarsRepository());
      await carRepo.saveCarRecords(cars);
      Fullscreenloader.stopLoading();
      Get.snackbar(
        "Sueccess",
        "Car created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
      );
      navigatorKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const CarUploadimage(),
          ),
          (route) => false);
    } catch (e) {
      Get.snackbar('err', e.toString());
    }
  }

  uploadCarPic() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageURL =
            await carRepo.uploadImageCar('Cars/Images/Profile', image);
        //Update car Image record
        Map<String, dynamic> json = {'CarPic': imageURL};
        await carRepo.updateSpecificCarData(json);
        cars.value.carPic;

        // Get.snackbar('Done!', 'Upload successfully',
        //     animationDuration: const Duration(seconds: 2),
        //     colorText: white,
        //     backgroundColor: green,
        //     icon: const Icon(Icons.done));
      }
    } catch (e) {
      print('=-=-=-=-==-=-=-=---==----=-=-=-=-=--=-=-=-=-=-');
      Get.snackbar('Error', e.toString(),
          animationDuration: const Duration(seconds: 2),
          colorText: white,
          backgroundColor: redColor,
          icon: const Icon(Icons.error));
    }
  }
}
