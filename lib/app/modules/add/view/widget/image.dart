// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/images.dart';
import 'package:up_market_app/app/modules/add/view_model/image_notifier.dart';

class ImageProfileAdd extends StatelessWidget {
  const ImageProfileAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<ImageNotifier>(context, listen: true)
            .imgstring
            .isNotEmpty
        ? Consumer<ImageNotifier>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  context.read<ImageNotifier>().showBottomSheet(context);
                },
                child: CircleAvatar(
                  radius: 80.w,
                  backgroundImage: MemoryImage(
                    const Base64Decoder().convert(
                      value.imgstring,
                    ),
                  ),
                ),
              );
            },
          )
        : GestureDetector(
            onTap: () {
              context.read<ImageNotifier>().showBottomSheet(context);
            },
            child: CircleAvatar(
              radius: 80.w,
              backgroundImage: AssetImage(AppImages.avathar),
            ),
          );
  }
}
