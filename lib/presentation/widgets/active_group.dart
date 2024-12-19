import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/button.dart';
import 'package:breadchain_sdk/presentation/widgets/semi_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveGroup extends StatelessWidget {
  const ActiveGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF0),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFFB4DFA7),
          width: 1.w,
        ),
      ),
      padding: EdgeInsets.all(AppSpacing.horizontalSpacing / 2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ben's birthday",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('3 members', style: TextStyle(fontSize: 12.sp)),
                        AppSpacing.horizontalSpaceSmall,
                        SvgPicture.asset(
                          'assets/svgs/brown_dot.svg',
                          package: 'breadchain_sdk',
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        const Text('\$2.90 a week'),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Goal: 30k',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        SvgPicture.asset(
                          'assets/svgs/brown_dot.svg',
                          package: 'breadchain_sdk',
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        SvgPicture.asset(
                          'assets/svgs/usdc_badge.svg',
                          package: 'breadchain_sdk',
                        ),
                        Transform.translate(
                          offset: const Offset(-8, 0),
                          child: SvgPicture.asset(
                            'assets/svgs/dai_badge.svg',
                            package: 'breadchain_sdk',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 3,
                child: SemiCircularProgressBar(value: 35),
              ),
            ],
          ),
          AppSpacing.verticalSpaceSmall,
          Button(
            'Details',
            type: ButtonType.alternate,
            onPressed: () {},
          ),
          AppSpacing.verticalSpaceSmall,
          Button(
            'Withdraw',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
