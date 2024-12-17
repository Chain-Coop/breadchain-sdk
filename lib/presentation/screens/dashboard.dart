import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/wallet_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const route = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
          child: Column(
            children: [
              AppSpacing.verticalSpaceSmall,
              const WalletCard(),
            ],
          ),
        ),
      ),
    );
  }
}