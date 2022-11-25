import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:up_market_app/app/app_style/routes.dart';
import 'package:up_market_app/app/modules/add/view_model/add_notifier.dart';
import 'package:up_market_app/app/modules/splash/view/splash.dart';
import 'package:up_market_app/app/modules/splash/view_model/splash_notifier.dart';

import 'app/app_style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => SplashNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => AddNotifier(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppRoutes.navigateKey,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.primary,
              primarySwatch: Colors.blue,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
