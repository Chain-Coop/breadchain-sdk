import 'package:flutter/material.dart';

import 'package:breadchain_sdk/blocs/main/main_bloc.dart';
import 'package:breadchain_sdk/blocs/saving_group/saving_group_bloc.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/models/init_config.dart';
import 'package:breadchain_sdk/presentation/screens/create_saving_group.dart';
import 'package:breadchain_sdk/presentation/screens/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreadChainSDKApp extends StatelessWidget {
  const BreadChainSDKApp({
    super.key,
    this.initConfig,
    this.pageStorageBucket,
    required this.navigatorKey,
  });

  final InitConfig? initConfig;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageStorageBucket? pageStorageBucket;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc(),
        ),
        BlocProvider(
          create: (context) => SavingGroupBloc(),
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) => previous.canPop != current.canPop,
        builder: (context, state) => PopScope(
          canPop: state.canPop,
          onPopInvokedWithResult: (didPop, result) {
            if (navigatorKey.currentState!.canPop()) {
              navigatorKey.currentState!.pop(result);
            }
          },
          child: ScreenUtilInit(
            designSize: const Size(375, 800),
            minTextAdapt: true,
            builder: (context, child) => MaterialApp(
              navigatorKey: navigatorKey,
              navigatorObservers: [
                _SDKAppNavigatorObserver(
                  onRouteChanged: (route) => context
                      .read<MainBloc>()
                      .add(MainEvent.routeChanged(route)),
                )
              ],
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  surfaceTintColor: Colors.transparent,
                  elevation: 3,
                ),
                textTheme: TextTheme(
                  headlineLarge: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 16.sp,
                  ),
                  bodySmall: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
              routes: {
                DashboardScreen.routeName: (context) => const DashboardScreen(),
                CreateSavingGroupScreen.routeName: (context) =>
                    const CreateSavingGroupScreen(),
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SDKAppNavigatorObserver extends NavigatorObserver {
  final Function(String) onRouteChanged;

  _SDKAppNavigatorObserver({required this.onRouteChanged});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    onRouteChanged.call(route.settings.name ?? '');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    onRouteChanged.call(previousRoute?.settings.name ?? '');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    onRouteChanged.call(newRoute?.settings.name ?? '');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    onRouteChanged.call(previousRoute?.settings.name ?? '');
  }
}
