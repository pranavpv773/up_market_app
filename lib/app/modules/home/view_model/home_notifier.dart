import 'package:flutter/material.dart';
import 'package:up_market_app/app/modules/home/view/widgets/edit_model.dart';

class HomeNotifier with ChangeNotifier {
  editBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext ctx) {
        return const EditModelSheet();
      },
    );
  }
}
