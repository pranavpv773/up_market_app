import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/app_style/images.dart';
import 'package:up_market_app/app/modules/add/view/widget/button.dart';
import 'package:up_market_app/app/modules/add/view/widget/loading_button.dart';
import 'package:up_market_app/app/modules/add/view/widget/textform.dart';
import 'package:up_market_app/app/modules/add/view_model/image_notifier.dart';
import 'package:up_market_app/app/modules/home/view_model/edit_notifier.dart';

class EditModelSheet extends StatelessWidget {
  const EditModelSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<EditNotifier>(builder: (context, val, _) {
      return SizedBox(
        height: 570.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Form(
              key: context.read<EditNotifier>().editFormKey,
              child: Column(
                children: [
                  context.watch<ImageNotifier>().imgstring == ""
                      ? GestureDetector(
                          onTap: () {
                            context
                                .read<ImageNotifier>()
                                .showBottomSheet(context);
                          },
                          child: CircleAvatar(
                            radius: 50.w,
                            backgroundImage: AssetImage(
                              AppImages.avathar,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context
                                .read<ImageNotifier>()
                                .showBottomSheet(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(60.w),
                              image: DecorationImage(
                                image: MemoryImage(
                                  const Base64Decoder().convert(
                                    context
                                        .read<ImageNotifier>()
                                        .imgstring
                                        .toString(),
                                  ),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                  TextformsField(
                    icon: Icons.person,
                    title: "Name",
                    controller:
                        Provider.of<EditNotifier>(context, listen: false)
                            .nameCtrlr,
                  ),
                  TextformsField(
                    icon: Icons.phone_android,
                    title: "Phone",
                    controller:
                        Provider.of<EditNotifier>(context, listen: false)
                            .phoneCtrlr,
                    textype: TextInputType.number,
                  ),
                  TextformsField(
                    icon: Icons.email_outlined,
                    title: "Email",
                    controller:
                        Provider.of<EditNotifier>(context, listen: false)
                            .emailCtrlr,
                    textype: TextInputType.emailAddress,
                  ),
                  TextformsField(
                    icon: Icons.computer_rounded,
                    title: "Section",
                    controller:
                        Provider.of<EditNotifier>(context, listen: false)
                            .sectionCtrlr,
                  ),
                  TextformsField(
                    icon: Icons.roller_shades_closed_outlined,
                    title: "Role",
                    controller:
                        Provider.of<EditNotifier>(context, listen: false)
                            .roleCtrlr,
                  ),
                  context.watch<EditNotifier>().load == true
                      ? const LoadingButton()
                      : ButtonWidget(
                          title: "Update",
                          function: () {
                            context
                                .read<EditNotifier>()
                                .updateTeamMate(context);
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
