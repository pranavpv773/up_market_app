import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/add/view_model/add_notifier.dart';

import 'button.dart';
import 'image.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: context.read<AddNotifier>().formKey,
            child: Padding(
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
          ),
          context.watch<AddNotifier>().loading == true
              ? Padding(
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
                )
              : ButtonWidget(
                  title: "ADD",
                  function: () {
                    context.read<AddNotifier>().addTeamMate(context);
                  },
                )
        ],
      ),
    );
  }
}
