import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/add/view/add_screen.dart';

class FloatingWidget extends StatelessWidget {
  const FloatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.avathar1,
      onPressed: () {
        AppRoutes.nextScreen(screen: const AddSCreen());
      },
      child: const Icon(Icons.add),
    );
  }
}
