import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerButton extends HookWidget {
  const ContainerButton({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String icon;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return GestureDetector(
      onTapDown: (_) => isPressed.value = true,
      onTapUp: (_) => isPressed.value = false,
      onTapCancel: () => isPressed.value = false,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
        decoration: BoxDecoration(
          color: isPressed.value
              ? AppColors.primary.withValues(alpha: .2)
              : const Color(0xFFF5F0F0).withValues(alpha: .17),
          borderRadius: BorderRadius.circular(8),
          border: isPressed.value
              ? Border.all(
                  color: AppColors.primary,
                )
              : null,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svgs/$icon.svg',
              package: 'breadchain_sdk',
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            AppSpacing.verticalSpaceSmall,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
