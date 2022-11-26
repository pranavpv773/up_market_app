import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/login/view/login.dart';
import 'package:up_market_app/app/modules/splash/view/no_internet.dart';

class SplashNotifier with ChangeNotifier {
  SplashNotifier() {
    goScreenOne();
  }
  bool checkingButton = false;

  goScreenOne() async {
    final check = await checking();

    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    AppRoutes.removeScreenUntil(
      screen: check == true ? const LoginScreen() : const NoInternet(),
    );
  }

  Future<bool> checking() async {
    checkingButton = true;
    notifyListeners();
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        checkingButton = false;
        notifyListeners();
        return true;
      }
      checkingButton = false;
      notifyListeners();

      return false;
    } on SocketException catch (_) {
      log('not connected');
      checkingButton = false;
      notifyListeners();

      return false;
    }
  }
}
