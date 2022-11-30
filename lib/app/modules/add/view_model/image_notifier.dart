// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_market_app/app/modules/add/view/widget/image_bottom.dart';

class ImageNotifier with ChangeNotifier {
  Future<void> takePhoto(BuildContext context) async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return;

    imagefile = File(image.path);

    final bayts = File(image.path).readAsBytesSync();
    String encode = base64Encode(bayts);
    changeImage(encode);
    base64Encode(bayts);
  }

  // Future<void> takecamera(BuildContext context) async {
  //   XFile? image = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //   );

  //   if (image == null) {
  //     return;
  //   }

  //   imagefile = File(image.path);

  //   final bayts = File(image.path).readAsBytesSync();
  //   String encode = base64Encode(bayts);
  //   changeImage(encode);
  //   base64Encode(bayts);
  // }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ImageBottomSheet();
      },
    );
  }

  File? imagefile;
  String imgstring = '';
  changeImage(String imgstring) {
    this.imgstring = imgstring;
    notifyListeners();
  }
}
