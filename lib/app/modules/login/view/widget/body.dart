import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/app_style/text_styles.dart';
import 'package:up_market_app/app/modules/login/view_model/login_notifier.dart';
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
    return Consumer<LoginNotifier>(builder: (context, val, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Card(
              color: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              shadowColor: AppColors.primary,
              child: SizedBox(
                width: width.w / 1.2.w,
                height: height.h / 2.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      context.watch<LoginNotifier>().signUp
                          ? "SignUp"
                          : "SignIn",
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
    });
  }
}
