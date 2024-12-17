import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  static double horizontalSpacing = 15.w;

  static Widget verticalSpaceTiny = SizedBox(height: 5.h);
  static Widget verticalSpaceSmall = SizedBox(height: 10.h);
  static Widget verticalSpaceMedium = SizedBox(height: 25.h);
  static Widget verticalSpaceLarge = SizedBox(height: 40.h);
  static Widget verticalSpaceHuge = SizedBox(height: 60.h);

  static Widget horizontalSpaceTiny = SizedBox(width: 5.w);
  static Widget horizontalSpaceSmall = SizedBox(width: 10.w);
  static Widget horizontalSpaceMedium = SizedBox(width: 25.w);
  static Widget horizontalSpaceLarge = SizedBox(width: 40.w);
}
