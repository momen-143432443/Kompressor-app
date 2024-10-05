import 'package:cloud_firestore/cloud_firestore.dart';

class CarsModel {
  final String? id;
  final String carMake;
  final String carModel;
  final String carYear;
  final String carPic;
  final String? nameYourCar;

  const CarsModel(
      {this.id,
      required this.carMake,
      required this.carModel,
      required this.carYear,
      required this.carPic,
      required this.nameYourCar});

  Map<String, dynamic> toJson() {
    return {
      "CarMake": carMake,
      "CarModel": carModel,
      "CarYear": carYear,
      'CarPic': carPic,
      "NameYourCar": nameYourCar
    };
  }

  static CarsModel carsModelempty() => const CarsModel(
      carMake: '', carModel: '', carYear: '', carPic: '', nameYourCar: '');

  //Map car fetched from firebase to car model
  factory CarsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data()!;
      return CarsModel(
          id: documentSnapshot.id,
          carMake: data["CarMake"] ?? '',
          carModel: data["CarModel"] ?? '',
          carYear: data["CarYear"] ?? '',
          carPic: data['CarPic'] ?? '',
          nameYourCar: data["NameYourCar"] ?? '');
    } else {
      return CarsModel.carsModelempty();
    }
  }
}
