import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckConnect extends GetxController {
  static CheckConnect get instance => Get.find();

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  final Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;

// Initialize the network manager and set up a stream to continually check the connection state
  @override
  void onInit() async {
    super.onInit();
    updateConnectionState;
  }

  Future<void> updateConnectionState(ConnectivityResult result) async {
    connectionStatus.value = result;
    if (connectionStatus.value == ConnectionState.none) {
      Get.snackbar('No internet connection', '');
    }
  }

  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    try {
      if (result == ConnectionState.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}
