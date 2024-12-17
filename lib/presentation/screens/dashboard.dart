import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.verticalSpaceSmall,
                const ProfileCard(),
                AppSpacing.verticalSpaceSmall,
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: AppSpacing.horizontalSpacing / 2),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDF0),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              children: [
                                AppSpacing.verticalSpaceMedium,
                                SvgPicture.asset(
                                  'assets/svgs/plus.svg',
                                  package: 'breadchain_sdk',
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                  width: 40.w,
                                  height: 40.h,
                                ),
                                AppSpacing.verticalSpaceSmall,
                                const Text("Create saving group"),
                                AppSpacing.verticalSpaceSmall,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: AppSpacing.horizontalSpacing / 2),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFDF0),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: AppSpacing.horizontalSpacing),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    child: SvgPicture.asset(
                                      'assets/svgs/history_large.svg',
                                      package: 'breadchain_sdk',
                                      width: 94.w,
                                      height: 94.h,
                                    ),
                                  ),
                                  Column(
                                    verticalDirection: VerticalDirection.down,
                                    children: [
                                      SizedBox(
                                        height: 75.h,
                                      ),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("History"),
                                      ),
                                      AppSpacing.verticalSpaceSmall,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                AppSpacing.verticalSpaceSmall,
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFDF0),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  height: 95.h,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppSpacing.horizontalSpacing),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: SvgPicture.asset(
                            'assets/svgs/grafiti.svg',
                            package: 'breadchain_sdk',
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: const Text(
                              'My groups(2)',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AppSpacing.verticalSpaceMedium,
                Text(
                  "Active Groups",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
