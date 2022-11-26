import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/app_style/text_styles.dart';
import 'login_widget.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 50,
            shadowColor: AppColors.primary,
            child: SizedBox(
              width: width / 1.2,
              height: height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "SignIn",
                    style: AppTextstyles.h1.copyWith(
                      color: AppColors.kDark,
                    ),
                  ),
                  const LoginFormWidget()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
