import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/app_style/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDownBig(child: Center(child: Image.asset(AppImages.splash))),
          const Text("TEAM"),
          const SizedBox(),
        ],
      ),
    );
  }
}
