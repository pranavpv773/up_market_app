// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class LoginNotifier with ChangeNotifier {
  final userName = TextEditingController();
  final password = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool obsecure = true;

  bool obSecureFn() {
    if (obsecure == true) {
      obsecure = false;
      notifyListeners();
    } else {
      obsecure = true;
      notifyListeners();
    }
    notifyListeners();
    return obsecure;
  }

  void disposeCntrl() {
    userName.clear();
    password.clear();
  }
}
