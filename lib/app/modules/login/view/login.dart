import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/modules/login/view/widget/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.avathar,
      body: Body(
        width: width,
        height: height,
      ),
    );
  }
}
