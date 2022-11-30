// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/add/model/add_mate.dart';
import 'package:up_market_app/app/modules/add/view_model/image_notifier.dart';

class EditNotifier with ChangeNotifier {
  final editFormKey = GlobalKey<FormState>();
  final nameCtrlr = TextEditingController();
  final emailCtrlr = TextEditingController();
  final phoneCtrlr = TextEditingController();
  final roleCtrlr = TextEditingController();
  final sectionCtrlr = TextEditingController();
  String uidd = "";
  String image = "";
  bool load = false;
  Future<void> deleteTeamMate(uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection('teams').doc(uid).delete();
    Fluttertoast.showToast(msg: "Deleted successfully");
    notifyListeners();
  }

  namingFunction(BuildContext context, QueryDocumentSnapshot<Object?> doc) {
    uidd = doc['uid'];
    context.read<ImageNotifier>().imgstring = doc['image'];
    nameCtrlr.text = doc['name'];
    phoneCtrlr.text = doc['phone'].toString();
    emailCtrlr.text = doc['email'];
    sectionCtrlr.text = doc['section'];
    roleCtrlr.text = doc['role'];

    notifyListeners();
  }

  updateTeamMate(BuildContext context) async {
    load = true;
    notifyListeners();
    if (editFormKey.currentState!.validate()) {
      if (context.read<ImageNotifier>().imgstring.isEmpty) {
        load = true;
        notifyListeners();
        context.read<ImageNotifier>().imgstring = "";
        image = context.read<ImageNotifier>().imgstring;
      } else {
        image = context.read<ImageNotifier>().imgstring;
      }

      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      //calling our userModel
      final data = TeamModel(
        uid: uidd,
        name: nameCtrlr.text.trim(),
        email: emailCtrlr.text.trim(),
        phone: int.parse(phoneCtrlr.text.trim()),
        section: sectionCtrlr.text.trim(),
        role: roleCtrlr.text.trim(),
        image: image,
      );
      await firebaseFirestore
          .collection('teams')
          .doc(uidd)
          .update(
            data.toMap(),
          )
          .then((value) {
        AppRoutes.backScreen();
        context.read<ImageNotifier>().imgstring = "";
        load = false;
        notifyListeners();
      });
    }

    load = false;
    notifyListeners();
  }
}
