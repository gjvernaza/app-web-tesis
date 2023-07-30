import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(context) => MediaQuery.of(context).size.width < 700;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < 900 &&
      MediaQuery.of(context).size.width >= 700;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 110) {
      return desktop;
    // ignore: unnecessary_null_comparison
    } else if (size.width >= 700 && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
