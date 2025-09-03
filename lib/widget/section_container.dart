import 'package:flutter/material.dart';
import 'responsive.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Key? anchorKey;
  const SectionContainer({super.key, required this.child, this.anchorKey});

  @override
  Widget build(BuildContext context) {
    final w = R.maxContentWidth(context);
    return Container(
      key: anchorKey,
      padding: R.pagePadding(context),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: w),
        child: child,
      ),
    );
  }
}
