import 'package:flutter/material.dart';

import 'package:breadchain_sdk/blocs/saving_group/saving_group_bloc.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/presentation/widgets/button.dart';
import 'package:breadchain_sdk/presentation/widgets/currency_pill.dart';
import 'package:breadchain_sdk/presentation/widgets/text_input_widget.dart';
import 'package:breadchain_sdk/presentation/widgets/two_pair_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOpenGroupScreen extends StatelessWidget {
  static const String routeName = 'create-saving-group';

  const CreateOpenGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Cycle'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<SavingGroupBloc, SavingGroupState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.primary,
                padding: EdgeInsets.all(AppSpacing.horizontalSpacing / 2),
                child: const Stack(
                  children: [
                    Positioned(
                      left: 30,
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Create Open Group',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceSmall,
              Center(
                child: Image.asset(
                  'assets/images/piggy.png',
                  height: 150.h,
                  package: 'breadchain_sdk',
                ),
              ),
              AppSpacing.verticalSpaceSmall,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.horizontalSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextInputWidget(
                      title: 'Group title',
                      subTitle: 'Max. 100 characters.',
                      maxLength: 100,
                    ),
                    AppSpacing.verticalSpaceSmall,
                    const TextInputWidget(
                      title: 'Group Description',
                      maxLines: 3,
                    ),
                    AppSpacing.verticalSpaceMedium,
                    const Center(
                      child: Text(
                        "What Currency are you Saving in?",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    AppSpacing.verticalSpaceMedium,
                    TwoPairWidget(
                      child1: Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: const CurrencyPill(
                          currency: 'Lisk',
                          currencyIconPath: 'assets/svgs/lisk.svg',
                          selected: true,
                        ),
                      ),
                      child2: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: const CurrencyPill(
                          currency: 'USDC',
                          currencyIconPath: 'assets/svgs/usdc.svg',
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpaceSmall,
                    TwoPairWidget(
                      child1: Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: const CurrencyPill(
                          currency: 'USDT',
                          currencyIconPath: 'assets/svgs/usdt.svg',
                        ),
                      ),
                      child2: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: const CurrencyPill(
                          currency: 'Naira',
                          currencyIconPath: 'assets/images/ngn.png',
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpaceMedium,
                    Button('Continue', onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Container(),
    );
  }
}
