import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  NavigatorState get navigator => Navigator.of(this);
  NavigatorState get rootNavigator => Navigator.of(this, rootNavigator: true);
}
