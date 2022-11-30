import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/add/model/add_mate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:up_market_app/app/modules/add/view_model/image_notifier.dart';

class AddNotifier with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameCtrlr = TextEditingController();
  final emailCtrlr = TextEditingController();
  final phoneCtrlr = TextEditingController();
  final roleCtrlr = TextEditingController();
  final sectionCtrlr = TextEditingController();
  bool loading = false;
  Future<void> addTeamMate(BuildContext context) async {
    loading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      try {
        log("reached");
        // calling our fireStore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        //calling our TeamModel
        final String image;
        if (context.read<ImageNotifier>().imgstring.isEmpty) {
          context.read<ImageNotifier>().imgstring = "";
          image = context.read<ImageNotifier>().imgstring;
        } else {
          image = context.read<ImageNotifier>().imgstring;
        }

        final teamMate = firebaseFirestore.collection('teams').doc();
        final data = TeamModel(
          uid: teamMate.id,
          name: nameCtrlr.text.trim(),
          email: emailCtrlr.text.trim(),
          phone: int.parse(phoneCtrlr.text.trim()),
          section: sectionCtrlr.text.trim(),
          role: roleCtrlr.text.trim(),
          image: image,
        );

        //sending details to fireStore
        await teamMate.set(data.toMap()).then(
          (value) {
            Fluttertoast.showToast(
              msg: "Successfully added",
              toastLength: Toast.LENGTH_LONG,
            );
            loading = false;
            AppRoutes.backScreen();
            disposeCtrl(context);
            notifyListeners();
          },
        );
      } on FirebaseException catch (e) {
        loading = false;
        notifyListeners();

        Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
    loading = false;
    notifyListeners();
  }

  disposeCtrl(BuildContext context) {
    nameCtrlr.clear();
    emailCtrlr.clear();
    phoneCtrlr.clear();
    sectionCtrlr.clear();
    context.read<ImageNotifier>().imgstring = "";
    roleCtrlr.clear();
  }

  mail(value) async {
    final val = isValidEmail(value);
    if (val == true) {
      return null;
    } else {
      return "invalid email format";
    }
  }

  phone(String value) async {
    if (value.length > 10) {
      return "invalid phone number";
    } else if (value.length < 10) {
      final val = 10 - value.length;
      return "$val number is missing in phone number ";
    }
  }

  validate(value) {
    if (value!.isEmpty) {
      return " Please fill this field";
    }
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
