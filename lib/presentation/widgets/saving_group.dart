import 'dart:math';

import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavingGroup extends StatelessWidget {
  const SavingGroup({
    super.key,
    this.completed = false,
  });

  final bool completed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .75.sw,
      child: Card(
        shadowColor: completed ? Colors.transparent : null,
        color: completed ? AppColors.primary.withValues(alpha: .1) : null,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                    child: Image.asset(
                      'assets/images/saving_group.png',
                      package: 'breadchain_sdk',
                      height: .25.sh,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 5.w,
                    left: 5.w,
                    child: SvgPicture.asset(
                      'assets/svgs/saving_group_pin.svg',
                      package: 'breadchain_sdk',
                    ),
                  )
                ],
              ),
              AppSpacing.verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            'Tech Achievers',
                            style: context.textTheme.headlineSmall,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: pi,
                                    child: CircularProgressIndicator(
                                      value: .5,
                                      backgroundColor: AppColors.primary
                                          .withValues(alpha: .2),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        AppColors.primary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '50%',
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Row(
                      children: [
                        Text(
                          "10 Members",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF6E6C6C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        SvgPicture.asset('assets/svgs/dot.svg',
                            package: 'breadchain_sdk'),
                        AppSpacing.horizontalSpaceSmall,
                        Text(
                          "\$10 daily",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF6E6C6C),
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Row(
                      children: [
                        Text(
                          "Goal",
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ": \$100k per member",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF6E6C6C),
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Text(
                      "Total saved: \$100.5m",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6E6C6C),
                      ),
                    ),
                    AppSpacing.verticalSpaceMedium,
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: Button(
                              completed ? 'Withdraw' : 'Join',
                              onPressed: () {},
                              fontSize: completed ? 13.sp : null,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Button(
                              'Details',
                              type: ButtonType.alternate,
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
