import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          height: 211.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
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
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
