import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.title,
    this.hintText,
    this.subTitle,
    this.maxLength,
    this.maxLines,
  });

  final String title;
  final String? hintText;
  final String? subTitle;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.verticalSpaceTiny,
        Card(
          margin: EdgeInsets.zero,
          child: TextField(
            maxLength: maxLength,
            buildCounter: (BuildContext context,
                {required int currentLength,
                required bool isFocused,
                required int? maxLength}) {
              return null;
            },
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Color(0xFFE3E3E3),
                  width: .5,
                ),
              ),
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Color(0xFFE3E3E3),
                  width: .5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Color(0xFFE3E3E3),
                  width: .5,
                ),
              ),
              filled: true,
              hintStyle: const TextStyle(
                color: Color(0xFFC6C6C6),
              ),
              hintText: hintText,
            ),
          ),
        ),
        AppSpacing.verticalSpaceTiny,
        if (subTitle != null)
          Text(
            subTitle!,
            style: context.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF363636).withValues(alpha: .5),
            ),
          ),
      ],
    );
  }
}
