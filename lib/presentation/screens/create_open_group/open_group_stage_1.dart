part of 'create_open_group.dart';

class _OpenGroupStage1 extends StatelessWidget {
  const _OpenGroupStage1();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextInputWidget(
          title: 'Group title',
          subTitle: 'Max. 100 characters.',
          maxLength: 100,
        ),
        AppSpacing.verticalSpaceMedium,
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
            child: const SelectableCurrencyPill(
              currency: 'Lisk',
              currencyIconPath: 'assets/svgs/lisk.svg',
              selected: true,
            ),
          ),
          child2: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: const SelectableCurrencyPill(
              currency: 'USDC',
              currencyIconPath: 'assets/svgs/usdc.svg',
            ),
          ),
        ),
        AppSpacing.verticalSpaceSmall,
        TwoPairWidget(
          child1: Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: const SelectableCurrencyPill(
              currency: 'USDT',
              currencyIconPath: 'assets/svgs/usdt.svg',
            ),
          ),
          child2: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: const SelectableCurrencyPill(
              currency: 'Naira',
              currencyIconPath: 'assets/images/ngn.png',
            ),
          ),
        ),
      ],
    );
  }
}
