import 'package:flutter/material.dart';

class AppRoutes {
  static final navigateKey = GlobalKey<NavigatorState>();

  static nextScreen({required var screen}) {
    navigateKey.currentState?.push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeScreen({required var screen}) {
    navigateKey.currentState?.pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static removeScreenUntil({required var screen}) {
    navigateKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (route) => false);
  }

  static backScreen() {
    navigateKey.currentState?.pop();
  }
}
