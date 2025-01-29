part of 'create_open_group.dart';

class _OpenGroupStage2 extends StatelessWidget {
  const _OpenGroupStage2();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputWidget(
          title: 'Total saving amount',
          keyboardType: TextInputType.number,
          subTitle: 'Set the amount each member will deposit',
        ),
      ],
    );
  }
}
