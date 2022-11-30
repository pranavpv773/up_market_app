import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/colors.dart';
import 'package:up_market_app/app/modules/home/view/widgets/null_data_widget.dart';
import 'package:up_market_app/app/modules/home/view/widgets/shimmer_screen.dart';
import 'package:up_market_app/app/modules/home/view_model/edit_notifier.dart';
import 'package:up_market_app/app/modules/home/view_model/home_notifier.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('teams').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const ShimmerBuilderWidget();
          } else if (snapshot.data!.docs.isEmpty) {
            return const HomeNull();
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          context.read<EditNotifier>().deleteTeamMate(
                              snapshot.data!.docs[index]['uid']);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: FadeInUpBig(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        shadowColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            snapshot.data!.docs[index]['image'] == ""
                                ? const AvatharWidget()
                                : Container(
                                    margin: const EdgeInsets.all(10),
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(60.w),
                                      image: DecorationImage(
                                        image: MemoryImage(
                                          const Base64Decoder().convert(
                                            snapshot.data!.docs[index]['image']
                                                .toString(),
                                          ),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Name: ${snapshot.data!.docs[index]['name'].toString().toUpperCase()}",
                                ),
                                Text(
                                  "Phone: ${snapshot.data!.docs[index]['phone'].toString()}",
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  context
                                      .read<HomeNotifier>()
                                      .editBottomSheet(context);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

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
