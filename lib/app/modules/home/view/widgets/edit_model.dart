import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/images.dart';
import 'package:up_market_app/app/modules/add/view/widget/button.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/add/view_model/add_notifier.dart';

class EditModelSheet extends StatelessWidget {
  const EditModelSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 570.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50.w,
                backgroundImage: AssetImage(
                  AppImages.avathar,
                ),
              ),
              TextformsField(
                icon: Icons.person,
                title: "Name",
                controller:
                    Provider.of<AddNotifier>(context, listen: false).nameCtrlr,
              ),
              TextformsField(
                icon: Icons.phone_android,
                title: "Phone",
                controller:
                    Provider.of<AddNotifier>(context, listen: false).phoneCtrlr,
                textype: TextInputType.number,
              ),
              TextformsField(
                icon: Icons.email_outlined,
                title: "Email",
                controller:
                    Provider.of<AddNotifier>(context, listen: false).emailCtrlr,
                textype: TextInputType.emailAddress,
              ),
              TextformsField(
                icon: Icons.computer_rounded,
                title: "Section",
                controller: Provider.of<AddNotifier>(context, listen: false)
                    .sectionCtrlr,
              ),
              TextformsField(
                icon: Icons.roller_shades_closed_outlined,
                title: "Role",
                controller:
                    Provider.of<AddNotifier>(context, listen: false).roleCtrlr,
              ),
              const ButtonWidget(title: "Update")
            ],
          ),
        ),
      ),
    );
  }
}
