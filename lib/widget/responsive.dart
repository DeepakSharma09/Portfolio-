import 'package:flutter/material.dart';

class R {
  static bool isMobile(BuildContext c) => MediaQuery.sizeOf(c).width < 700;
  static bool isTablet(BuildContext c) =>
      MediaQuery.sizeOf(c).width >= 700 && MediaQuery.sizeOf(c).width < 1100;
  static bool isDesktop(BuildContext c) =>
      MediaQuery.sizeOf(c).width >= 1100;

  static double maxContentWidth(BuildContext c) =>
      isDesktop(c) ? 1200 : (isTablet(c) ? 900 : 600);

  static EdgeInsets pagePadding(BuildContext c) => EdgeInsets.symmetric(
    horizontal: isDesktop(c) ? 32 : 20,
    vertical: 24,
  );
}
