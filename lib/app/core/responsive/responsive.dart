

import 'package:flutter/material.dart';
import '../utils/values.dart';
import 'responsive_context.dart';


class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile() =>
      MediaQuery.of(ResponsiveContext.responsiveContext.context).size.width <= CustomJioValues.mobileMaxWidth;

  static bool isTablet() =>
      MediaQuery.of(ResponsiveContext.responsiveContext.context).size.width <= CustomJioValues.tabletMaxWidth &&
      MediaQuery.of(ResponsiveContext.responsiveContext.context).size.width >= CustomJioValues.tabletMinWidth;

  static bool isDesktop() =>
      MediaQuery.of(ResponsiveContext.responsiveContext.context).size.width >= CustomJioValues.desktopMinWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= CustomJioValues.desktopMinWidth) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= CustomJioValues.tabletMinWidth && size.width <= CustomJioValues.tabletMaxWidth) {
      return tablet;
    }
    // Or less then that we called it mobile
    else {
      return mobile;

    }
  }
}