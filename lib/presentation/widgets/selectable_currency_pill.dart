import 'package:flutter/material.dart';

import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableCurrencyPill extends StatelessWidget {
  const SelectableCurrencyPill({
    super.key,
    required this.currencyIconPath,
    required this.currency,
    this.selected = false,
  });

  final String currencyIconPath;
  final String currency;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: currencyIconPath.endsWith('.svg')
                ? SvgPicture.asset(
                    currencyIconPath,
                    package: 'breadchain_sdk',
                    width: 18.w,
                    height: 18.w,
                  )
                : Image.asset(
                    currencyIconPath,
                    package: 'breadchain_sdk',
                    width: 18.w,
                    height: 18.w,
                  ),
          ),
          Expanded(
            child: Text(currency),
          ),
          Expanded(
            child: selected
                ? SvgPicture.asset(
                    'assets/svgs/selected_check.svg',
                    package: 'breadchain_sdk',
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
