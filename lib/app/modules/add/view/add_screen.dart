import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/images.dart';
import 'package:up_market_app/app/modules/add/view/widget/image.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/add/view_model/add_notifier.dart';
import 'package:up_market_app/app/modules/home/view/widgets/appbar.dart';

import 'widget/button.dart';

class AddSCreen extends StatelessWidget {
  const AddSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: const AppbarWidget(
          title: "Add Team Members",
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //const SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ImageProfileAdd(),
                  TextformsField(
                    icon: Icons.person,
                    title: "Name",
                    controller: context.read<AddNotifier>().nameCtrlr,
                  ),
                  TextformsField(
                    icon: Icons.phone_android,
                    title: "Phone",
                    controller: context.read<AddNotifier>().phoneCtrlr,
                    textype: TextInputType.number,
                  ),
                  TextformsField(
                    icon: Icons.email_outlined,
                    title: "Email",
                    controller: context.read<AddNotifier>().emailCtrlr,
                    textype: TextInputType.emailAddress,
                  ),
                  TextformsField(
                    icon: Icons.computer_rounded,
                    title: "Section",
                    controller: context.read<AddNotifier>().sectionCtrlr,
                  ),
                  TextformsField(
                    icon: Icons.roller_shades_closed_outlined,
                    title: "Role",
                    controller: context.read<AddNotifier>().roleCtrlr,
                  ),
                ],
              ),
            ),
            ButtonWidget(
              title: "ADD",
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}
