import 'package:breadchain_sdk/blocs/saving_group/saving_group_bloc.dart';
import 'package:breadchain_sdk/config/spacing.dart';
import 'package:breadchain_sdk/extensions/build_context.dart';
import 'package:breadchain_sdk/presentation/widgets/button.dart';
import 'package:breadchain_sdk/presentation/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateSavingGroupScreen extends StatelessWidget {
  static const String routeName = 'create-saving-group';

  const CreateSavingGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Saving Group'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<SavingGroupBloc, SavingGroupState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.verticalSpaceSmall,
                Center(
                  child: Image.asset(
                    'assets/images/astronaut.png',
                    height: 150.h,
                    package: 'breadchain_sdk',
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                const TextInputWidget(
                  title: 'Group name',
                  subTitle: 'Max. 100 characters.',
                  maxLength: 100,
                ),
                AppSpacing.verticalSpaceSmall,
                const TextInputWidget(
                  title: 'Description',
                  maxLines: 3,
                ),
                AppSpacing.verticalSpaceSmall,
                Text(
                  "Deposit amount",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                Center(
                  child: Text(
                    '\$ ${state.depositAmount.toStringAsFixed(0)}',
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -13),
                  child: Text(
                    "Set the amount each member deposits",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF363636).withValues(alpha: .5),
                    ),
                  ),
                ),
                Text(
                  "Select a Currency/Token",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                AppSpacing.verticalSpaceSmall,
                Text(
                  "Frequency of savings deposit",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                AppSpacing.verticalSpaceSmall,
                Text(
                  "Duration (weekly)",
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.verticalSpaceSmall,
                Button('Continue', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
