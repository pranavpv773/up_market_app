import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_market_app/app/app_style/colors.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.h,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.avathar1,
      title: Text(
        title,
      ),
      centerTitle: true,
    );
  }
}
