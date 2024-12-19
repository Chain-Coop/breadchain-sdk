import 'package:breadchain_sdk/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color disabledTextColor;

  final IconData? icon;
  final Color? iconColor;
  final bool busy;
  final bool pill;
  final String? busyText;
  final ButtonType type;

  const Button(
    this.text, {
    super.key,
    this.onPressed,
    this.icon,
    this.iconColor,
    this.disabledTextColor = Colors.white,
    this.busy = false,
    this.pill = false,
    this.type = ButtonType.primary,
    this.busyText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return backgroundColor.withOpacity(0.8);
            } else if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return backgroundColor;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(pill ? 40 : 8.r),
            ),
          )),
        ),
        onPressed: onPressed,
        child: busy
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  if (busyText != null)
                    Text(
                      "     $busyText",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    )
                ],
              )
            : (icon == null
                ? Text(
                    text!,
                    style: TextStyle(
                      color: onPressed != null ? textColor : disabledTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Icon(
                    icon,
                    color: iconColor ?? Colors.black,
                  )),
      ),
    );
  }

  Color get backgroundColor {
    switch (type) {
      case ButtonType.primary:
        return AppColors.primary;
      case ButtonType.alternate:
        return AppColors.secondary;
    }
  }

  Color get textColor {
    return type == ButtonType.primary
        ? const Color(0xFFFCF9E8)
        : AppColors.primary;
  }
}

enum ButtonType { primary, alternate }
