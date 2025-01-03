import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:flutter/material.dart';

import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, this.currency = 'N', this.value = 0.0});

  final String currency;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Total group fund'),
                AppSpacing.horizontalSpaceSmall,
                const Icon(Icons.visibility_off),
              ],
            ),
            AppSpacing.verticalSpaceSmall,
            Text(
              '$currency ${value.toStringAsFixed(2)}',
              style: context.textTheme.headlineMedium,
            ),
            AppSpacing.verticalSpaceSmall,
            const Divider(
              color: AppColors.borderColor,
            ),
            AppSpacing.verticalSpaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Total Gains'),
                AppSpacing.horizontalSpaceTiny,
                SvgPicture.asset(
                  'assets/svgs/gain.svg',
                  package: 'breadchain_sdk',
                ),
                AppSpacing.horizontalSpaceTiny,
                Text(
                  '0%',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            AppSpacing.verticalSpaceSmall,
          ],
        ),
      ),
    );
  }
}
