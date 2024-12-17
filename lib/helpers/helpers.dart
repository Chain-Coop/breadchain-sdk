import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/models/init_config.dart';
import 'package:breadchain_sdk/presentation/navigator.dart';
import 'package:flutter/material.dart';

void openBreadChainSDK(BuildContext context, {InitConfig? initConfig}) {
  context.navigator.push(
      MaterialPageRoute(builder: (context) => const BreadChainSDKNavigator()));
}
