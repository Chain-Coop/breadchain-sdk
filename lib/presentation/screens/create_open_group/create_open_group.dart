import 'package:breadchain_sdk/presentation/widgets/selectable_text_pill.dart';
import 'package:flutter/material.dart';

import 'package:breadchain_sdk/blocs/saving_group/saving_group_bloc.dart';
import 'package:breadchain_sdk/config/colors.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/presentation/widgets/button.dart';
import 'package:breadchain_sdk/presentation/widgets/selectable_currency_pill.dart';
import 'package:breadchain_sdk/presentation/widgets/text_input_widget.dart';
import 'package:breadchain_sdk/presentation/widgets/two_pair_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'open_group_stage_1.dart';
part 'open_group_stage_2.dart';

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
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      child: GestureDetector(
                        onTap: () {
                          context.read<SavingGroupBloc>().add(
                              const SavingGroupEvent
                                  .firstOpenSavingGroupStage());
                          context.navigator.pop();
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Center(
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
                    LayoutBuilder(builder: (context, constraint) {
                      switch (state.createOpenGroupStage) {
                        case 1:
                          return const _OpenGroupStage1();
                        case 2:
                          return const _OpenGroupStage2();
                        default:
                          return const SizedBox.shrink();
                      }
                    }),
                    AppSpacing.verticalSpaceHuge,
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                if (state.createOpenGroupStage == 1) {
                                  context.navigator.pop();
                                } else {
                                  context.read<SavingGroupBloc>().add(
                                      const SavingGroupEvent
                                          .previousOpenSavingGroupStage());
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/svgs/previous_step.svg',
                                package: 'breadchain_sdk',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Button('Next', onPressed: () {
                            context.read<SavingGroupBloc>().add(
                                const SavingGroupEvent
                                    .nextOpenSavingGroupStage());
                          }),
                        ),
                      ],
                    ),
                    AppSpacing.verticalSpaceHuge,
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
