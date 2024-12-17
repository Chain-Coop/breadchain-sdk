import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      color: const Color(0xFF1D8500).withAlpha(110),
      blur: 30,
      padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(color: Color(0xFFE2FFD9)),
                ),
                AppSpacing.verticalSpaceTiny,
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/coin.svg',
                      package: 'breadchain_sdk',
                    ),
                    AppSpacing.horizontalSpaceTiny,
                    Text(
                      "254,352",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 40.w,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  iconAlignment: IconAlignment.start,
                  child: SvgPicture.asset(
                    'assets/svgs/plus.svg',
                    package: 'breadchain_sdk',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
