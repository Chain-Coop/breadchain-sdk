import 'package:flutter/material.dart';

class TwoPairWidget extends StatelessWidget {
  const TwoPairWidget({
    super.key,
    required this.child1,
    this.child2,
  });

  final Widget child1;
  final Widget? child2;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: child1),
      Expanded(
        child: child2 ?? const SizedBox(),
      )
    ]);
  }
}
