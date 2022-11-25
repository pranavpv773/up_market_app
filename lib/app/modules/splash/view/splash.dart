import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/images.dart';
import 'package:up_market_app/app/app_style/text_styles.dart';
import 'package:up_market_app/app/modules/splash/view_model/splash_notifier.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashNotifier>(builder: (context, val, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDownBig(
                child: Center(
              child: Image.asset(
                AppImages.splash,
              ),
            )),
            Text(
              "TEAM",
              style: AppTextstyles.h1,
            ),
            const SizedBox(),
          ],
        );
      }),
    );
  }
}
