import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:flutter/material.dart';

import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/wallet_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.address,
    this.hasNotification = false,
  });

  final String name;
  final String address;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: .29.sh,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/wallet_bg.jpg',
                  package: 'breadchain_sdk',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.1),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            width: double.infinity,
            height: .23.sh,
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/avatar.png',
                              package: 'breadchain_sdk',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        width: 40.r,
                        height: 40.r,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back!",
                              style: context.textTheme.bodySmall?.copyWith(
                                color: const Color(0xFFE0E0E0),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    name,
                                    style: context.textTheme.bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  AppSpacing.horizontalSpaceSmall,
                                  Text(
                                    address,
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFFE2FFD9),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/gift.svg',
                            package: 'breadchain_sdk',
                          ),
                          AppSpacing.horizontalSpaceSmall,
                          SvgPicture.asset(
                            'assets/svgs/bell.svg',
                            package: 'breadchain_sdk',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                AppSpacing.verticalSpaceSmall,
              ],
            ),
          ),
          Positioned(
            left: AppSpacing.horizontalSpacing / 2,
            right: AppSpacing.horizontalSpacing / 2,
            bottom: 0,
            child: const WalletCard(),
          )
        ],
      ),
    );
  }
}
