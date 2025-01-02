import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    super.key,
    required this.text,
    this.selected = false,
  });

  final String text;
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
          Text(
            text.toUpperCase(),
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
}
