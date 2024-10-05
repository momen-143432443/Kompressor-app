import 'package:ecar/Backend/connect.dart';
import 'package:get/get.dart';

class Generalbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CheckConnect());
  }
}
