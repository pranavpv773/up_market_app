import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';

class FloatingWidget extends StatelessWidget {
  const FloatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.avathar1,
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
