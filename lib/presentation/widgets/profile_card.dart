import 'dart:ui';

import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210.h,
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
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            width: double.infinity,
            height: 170.h,
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
                            const Text(
                              "Welcome back!",
                              style: TextStyle(
                                color: Color(0xFFE0E0E0),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const Text(
                                    "Mamus",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  AppSpacing.horizontalSpaceSmall,
                                  const Text(
                                    '0x56h..76',
                                    style: TextStyle(
                                      color: Color(0xFFE2FFD9),
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
            left: AppSpacing.horizontalSpacing,
            right: AppSpacing.horizontalSpacing,
            bottom: 0,
            child: const WalletCard(),
          )
        ],
      ),
    );
  }
}
