import 'package:flutter/material.dart';

import 'package:breadchain_sdk/blocs/main/main_bloc.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/models/event_config.dart';
import 'package:breadchain_sdk/presentation/screens/create_open_group/create_open_group.dart';
import 'package:breadchain_sdk/presentation/widgets/container_button.dart';
import 'package:breadchain_sdk/presentation/widgets/saving_group.dart';
import 'package:breadchain_sdk/presentation/widgets/scrollable_pad.dart';
import 'package:breadchain_sdk/presentation/widgets/wallet_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';

  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Cycle'),
        centerTitle: true,
        leadingWidth: 100.w,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<MainBloc, MainState>(
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
                        'Group Savings',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceLarge,
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.horizontalSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WalletCard(
                      value: state.initConfig.walletBalance?.toDouble() ?? 0,
                      currency: state.initConfig.primaryFiatCurrency,
                      balanceVisible: state.walletBalanceVisible,
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withValues(alpha: .1),
                          ),
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primary,
                            size: 12.sp,
                          ),
                        ),
                        AppSpacing.horizontalSpaceSmall,
                        const Text(
                          'Start Group Saving',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    AppSpacing.verticalSpaceSmall,
                    Text(
                      'Select any of the savings options to begin your contribution with others',
                      style: context.textTheme.bodySmall,
                    ),
                    AppSpacing.verticalSpaceMedium,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.horizontalSpacing),
                      child: ContainerButton(
                        icon: 'open_group',
                        title: 'Create Open Group',
                        subtitle: 'This clearly implies that\nanyone can join',
                        onTap: () {
                          state.initConfig.eventConfig?.onTap
                              ?.call(TapEvent.createClosedSavingGroup);
                          context.navigator
                              .pushNamed(CreateOpenGroupScreen.routeName);
                        },
                      ),
                    ),
                    AppSpacing.verticalSpaceMedium,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.horizontalSpacing),
                      child: ContainerButton(
                        icon: 'closed_group',
                        title: 'Create Closed Group',
                        subtitle:
                            'This implies that\nyou can only join by invite',
                        onTap: () {
                          state.initConfig.eventConfig?.onTap
                              ?.call(TapEvent.createClosedSavingGroup);
                        },
                      ),
                    ),
                    AppSpacing.verticalSpaceLarge,
                    const Text(
                      'Other Saving Groups',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSpacing.verticalSpaceSmall,
                    SizedBox(
                      height: .65.sh,
                      child: RawScrollbar(
                        scrollbarOrientation: ScrollbarOrientation.top,
                        thickness: 4.r,
                        radius: Radius.circular(4.r),
                        thumbColor: AppColors.primary,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(
                              top: AppSpacing.horizontalSpacing / 2),
                          children: const [
                            SavingGroup(),
                            SavingGroup(),
                            SavingGroup(),
                            SavingGroup(),
                          ],
                        ),
                      ),
                    ),
                    AppSpacing.verticalSpaceMedium,
                    const Text(
                      'Group History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DefaultTabController(
                      length: 2,
                      child: SizedBox(
                        height: .9.sh,
                        child: Column(
                          children: [
                            const TabBar(
                              labelColor: AppColors.textColor,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: AppColors.primary,
                              tabs: [
                                Tab(text: 'Ongoing'),
                                Tab(text: 'Completed'),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSpacing.horizontalSpacing),
                                    child: ScrollablePad(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppSpacing.horizontalSpacing),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppSpacing.verticalSpaceSmall,
                                            const Text('Active Groups'),
                                            AppSpacing.verticalSpaceSmall,
                                            Text(
                                              'These are the list of active groups you created',
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: const Color(0xFF6E6C6C),
                                              ),
                                            ),
                                            AppSpacing.verticalSpaceSmall,
                                            const Text('My groups (2)'),
                                            AppSpacing.verticalSpaceSmall,
                                            const SavingGroup(
                                              completed: true,
                                            ),
                                            const SavingGroup(
                                              completed: true,
                                            ),
                                            AppSpacing.verticalSpaceSmall,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: AppSpacing.horizontalSpacing),
                                    child: ScrollablePad(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppSpacing.horizontalSpacing),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppSpacing.verticalSpaceSmall,
                                            const Text('Previous Groups'),
                                            AppSpacing.verticalSpaceSmall,
                                            Text(
                                              'These are the list of active groups you created',
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: const Color(0xFF6E6C6C),
                                              ),
                                            ),
                                            AppSpacing.verticalSpaceSmall,
                                            const Text(
                                                'My Previous Groups (2)'),
                                            AppSpacing.verticalSpaceSmall,
                                            const SavingGroup(
                                              completed: true,
                                            ),
                                            const SavingGroup(
                                              completed: true,
                                            ),
                                            AppSpacing.verticalSpaceSmall,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
