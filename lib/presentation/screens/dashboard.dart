import 'package:breadchain_sdk/blocs/main/main_bloc.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/models/event_config.dart';
import 'package:breadchain_sdk/presentation/screens/create_saving_group.dart';
import 'package:breadchain_sdk/presentation/widgets/active_group.dart';
import 'package:breadchain_sdk/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '/';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.verticalSpaceSmall,
                  ProfileCard(
                    name: state.initConfig?.profileData?.name ?? 'Mamus',
                    address:
                        state.initConfig?.profileData?.address ?? '0x56h..76',
                    hasNotification: state.initConfig?.hasNotification ?? false,
                  ),
                  AppSpacing.verticalSpaceSmall,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: AppSpacing.horizontalSpacing / 2),
                          child: InkWell(
                            onTap: () {
                              context.navigator
                                  .pushNamed(CreateSavingGroupScreen.routeName);
                              state.initConfig?.eventConfig?.onTap
                                  ?.call(TapEvent.createSavingGroup);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFDF0),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Column(
                                children: [
                                  AppSpacing.verticalSpaceMedium,
                                  SvgPicture.asset(
                                    'assets/svgs/plus.svg',
                                    package: 'breadchain_sdk',
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.primary,
                                      BlendMode.srcIn,
                                    ),
                                    width: 40.w,
                                    height: 40.h,
                                  ),
                                  AppSpacing.verticalSpaceSmall,
                                  Text(
                                    "Create saving group",
                                    style: context.textTheme.bodySmall,
                                  ),
                                  AppSpacing.verticalSpaceSmall,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppSpacing.horizontalSpacing / 2),
                          child: InkWell(
                            onTap: () {
                              state.initConfig?.eventConfig?.onTap
                                  ?.call(TapEvent.history);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFDF0),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppSpacing.horizontalSpacing),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 0,
                                      child: SvgPicture.asset(
                                        'assets/svgs/history_large.svg',
                                        package: 'breadchain_sdk',
                                        width: 94.w,
                                        height: 94.h,
                                      ),
                                    ),
                                    Column(
                                      verticalDirection: VerticalDirection.down,
                                      children: [
                                        SizedBox(
                                          height: 75.h,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "History",
                                            style: context.textTheme.bodySmall,
                                          ),
                                        ),
                                        AppSpacing.verticalSpaceSmall,
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  AppSpacing.verticalSpaceSmall,
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFDF0),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    height: 95.h,
                    width: double.infinity,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: AppSpacing.horizontalSpacing),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: SvgPicture.asset(
                              'assets/svgs/grafiti.svg',
                              package: 'breadchain_sdk',
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Text(
                                'My groups(2)',
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.verticalSpaceMedium,
                  Text(
                    "Active Groups",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.verticalSpaceSmall,
                  const ActiveGroup(),
                  AppSpacing.verticalSpaceSmall,
                  const ActiveGroup(),
                  AppSpacing.verticalSpaceSmall,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
