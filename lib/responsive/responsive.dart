import 'package:flutter/material.dart';

class Responsive {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1280;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1280;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;
  const Responsive._();
}
