import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/modules/add/view_model/image_notifier.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: AppColors.avathar1,
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(
          children: [
            Text(
              'choose team photo',
              style: TextStyle(color: AppColors.kLight),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ImageNotifier>().takecamera(context);
                  },
                  icon: Icon(
                    Icons.camera_front_outlined,
                    color: AppColors.kLight,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<ImageNotifier>().takePhoto(context);
                  },
                  icon: Icon(
                    Icons.image_rounded,
                    color: AppColors.kLight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
