import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/models/init_config.dart';
import 'package:breadchain_sdk/presentation/sdk_app.dart';
import 'package:breadchain_sdk/service_locator.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void openBreadChainSDK(BuildContext context, {InitConfig? initConfig}) {
  // Register initConfig.
  if (!locator.isRegistered(instance: InitConfig)) {
    locator.registerSingleton<InitConfig>(initConfig ?? const InitConfig());
  }
  context.navigator.push(MaterialPageRoute(
    builder: (context) => BreadChainSDKApp(
      navigatorKey: navigatorKey,
    ),
  ));
}
