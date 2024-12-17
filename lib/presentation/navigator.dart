import 'package:breadchain_sdk/presentation/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreadChainSDKNavigator extends StatelessWidget {
  const BreadChainSDKNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      minTextAdapt: true,
      builder: (context, child) => Navigator(
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case DashboardScreen.route:
              builder = (BuildContext _) => const DashboardScreen();
              break;
            default:
              builder = (BuildContext _) => const DashboardScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
