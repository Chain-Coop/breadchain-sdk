import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableCryptoCard extends StatelessWidget {
  const SelectableCryptoCard({
    super.key,
    required this.asset,
    this.selected = false,
  });

  final String asset;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svgs/$assetIcon.svg',
            package: 'breadchain_sdk',
          ),
          AppSpacing.horizontalSpaceSmall,
          Text(
            asset.toUpperCase(),
            style: const TextStyle(
              color: AppColors.primary,
            ),
          ),
          if (selected)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/svgs/selected_check.svg',
                  package: 'breadchain_sdk',
                ),
              ),
            )
        ],
      ),
    );
  }

  String get assetIcon {
    switch (asset) {
      case 'bread':
        return 'bread';
      case 'dai':
        return 'dai';
      case 'usdc':
        return 'usdc';
      case 'usdt':
      default:
        return 'usdt';
    }
  }
}
