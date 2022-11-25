// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:up_market_app/app/app_style/colors.dart';

class TextformsField extends StatelessWidget {
  const TextformsField({
    Key? key,
    required this.title,
    required this.icon,
    required this.controller,
    this.icon1,
    this.obsecure,
    this.textype,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Widget? icon1;
  final bool? obsecure;
  final TextEditingController controller;
  final TextInputType? textype;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: height / 40,
        right: width * 0.02,
        left: width * 0.02,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textype ?? TextInputType.name,
        obscureText: obsecure ?? false,
        validator: (value) {
          if (value!.isEmpty) {
            return " Please fill this field";
          }
        },
        decoration: InputDecoration(
          fillColor: AppColors.primary,
          filled: true,
          suffixIcon: icon1,
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: AppColors.kLight,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: AppColors.kLight,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          label: Text(title),
          labelStyle: TextStyle(
            fontSize: 15,
            color: AppColors.avathar1,
          ),
        ),
      ),
    );
  }
}
