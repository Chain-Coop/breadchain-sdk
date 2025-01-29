import 'package:flutter/material.dart';

import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectableTextPill extends StatelessWidget {
  const SelectableTextPill({
    super.key,
    required this.text,
    this.selected = false,
  });

  final String text;
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
            child: Text(text),
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
