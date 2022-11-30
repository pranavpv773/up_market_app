import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_market_app/app/app_style/colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateProperty.all(
              AppColors.avathar,
            ),
          ),
          onPressed: () {},
          child: CupertinoActivityIndicator(
            color: AppColors.kLight,
          ),
        ),
      ),
    );
  }
}
