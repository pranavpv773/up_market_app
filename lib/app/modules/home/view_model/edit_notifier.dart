// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditNotifier with ChangeNotifier {
  final editFormKey = GlobalKey<FormState>();
  final nameCtrlr = TextEditingController();
  final emailCtrlr = TextEditingController();
  final phoneCtrlr = TextEditingController();
  final roleCtrlr = TextEditingController();
  final sectionCtrlr = TextEditingController();
  Future<void> deleteTeamMate(uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection('teams').doc(uid).delete();
    Fluttertoast.showToast(msg: "Deleted successfully");
    notifyListeners();
  }
}
