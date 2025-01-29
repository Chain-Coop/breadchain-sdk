part of 'create_open_group.dart';

class _OpenGroupStage2 extends StatelessWidget {
  const _OpenGroupStage2();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextInputWidget(
          title: 'Total saving amount',
          keyboardType: TextInputType.number,
          subTitle: 'Set the amount each member will deposit',
        ),
        AppSpacing.verticalSpaceMedium,
        Text(
          "Select Saving Frequency",
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacing.verticalSpaceMedium,
        TwoPairWidget(
          child1: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: const SelectableTextPill(
              text: 'Daily',
              selected: true,
            ),
          ),
          child2: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: const SelectableTextPill(
              text: 'Monthly',
            ),
          ),
        ),
        AppSpacing.verticalSpaceMedium,
        TwoPairWidget(
          child1: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: const SelectableTextPill(
              text: 'Weekly',
            ),
          ),
          child2: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: const SelectableTextPill(
              text: 'Quarterly',
            ),
          ),
        ),
      ],
    );
  }
}
