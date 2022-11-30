import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_market_app/app/app_style/colors.dart';

class AvatharWidget extends StatelessWidget {
  const AvatharWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(60.w),
        image: const DecorationImage(
          image: AssetImage(
            "assets/avathar.png",
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
