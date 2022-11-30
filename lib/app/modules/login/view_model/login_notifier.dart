// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/home/view/home_screen.dart';
import 'package:up_market_app/app/modules/login/view/login.dart';

class LoginNotifier with ChangeNotifier {
  final email = TextEditingController();
  final password = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool obsecure = true;
  bool signUp = false;
  bool logLoad = false;

  void cardFunction(bool change) {
    signUp = change;
    logLoad = false;
    notifyListeners();
  }

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
    email.clear();
    password.clear();
  }

  onTabLoginFunction() async {
    logLoad = true;
    notifyListeners();
    if (loginKey.currentState!.validate()) {
      logLoad = true;
      notifyListeners();
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        )
            .then((value) {
          AppRoutes.removeScreenUntil(
            screen: const HomeScreen(),
          );
          Fluttertoast.showToast(
            msg: "Logged in Successfully",
          );
        });
        notifyListeners();
        disposeCntrl();
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: e.toString().substring(30),
        );
        logLoad = false;
        notifyListeners();
      }
    }
    logLoad = false;
    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        AppRoutes.removeScreenUntil(
          screen: const LoginScreen(),
        );
        Fluttertoast.showToast(msg: "Logged out");
      },
    );
  }

  void onTabSignup() async {
    logLoad = true;
    notifyListeners();
    if (loginKey.currentState!.validate()) {
      logLoad = true;
      notifyListeners();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        )
            .then((value) {
          AppRoutes.removeScreenUntil(
            screen: const HomeScreen(),
          );
          Fluttertoast.showToast(msg: "SignUp Successfull");

          disposeCntrl();
        });
      } on FirebaseAuthException catch (ex) {
        Fluttertoast.showToast(msg: ex.message.toString());
        logLoad = false;
        notifyListeners();
      }
    }
    logLoad = false;
    notifyListeners();
  }
}
