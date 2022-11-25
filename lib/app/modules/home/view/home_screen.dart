import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/appbar.dart';
import 'widgets/body.dart';
import 'widgets/floating.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: const AppbarWidget(
          title: "Team Members",
        ),
      ),
      body: Body(width: width, height: height),
      floatingActionButton: const FloatingWidget(),
    );
  }
}
