import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/presentation/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreadChainSDKApp extends StatelessWidget {
  const BreadChainSDKApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        ),
        routes: {
          DashboardScreen.routeName: (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
