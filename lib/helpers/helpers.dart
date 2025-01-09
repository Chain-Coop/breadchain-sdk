import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/models/init_config.dart';
import 'package:breadchain_sdk/presentation/sdk_app.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void openBreadChainSDK(BuildContext context, {InitConfig? initConfig}) {
  context.navigator.push(MaterialPageRoute(
    builder: (context) => BreadChainSDKApp(
      initConfig: initConfig ?? const InitConfig(),
      navigatorKey: navigatorKey,
    ),
  ));
}
