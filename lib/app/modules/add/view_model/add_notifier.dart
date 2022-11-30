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
          name: nameCtrlr.text,
          email: emailCtrlr.text,
          phone: int.parse(phoneCtrlr.text),
          section: sectionCtrlr.text,
          role: roleCtrlr.text,
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
}
