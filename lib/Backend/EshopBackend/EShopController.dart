import 'package:get/get.dart';

class Eshopcontroller extends GetxController {
  static Eshopcontroller get instance => Get.find();
  String displayedInfo = 'Select an option';

  void allpress() {
    displayedInfo = 'All infos';
  }

  void accessoires() {
    displayedInfo = 'accessoires';
  }

  void carParts() {
    displayedInfo = 'car parts';
  }

  void carServices() {
    displayedInfo = 'car services';
  }

  void other() {
    displayedInfo = 'other';
  }
}
