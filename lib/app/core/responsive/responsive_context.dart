import 'package:flutter/cupertino.dart';

class ResponsiveContext {
  late BuildContext context;
  static final ResponsiveContext responsiveContext = ResponsiveContext._internal();

  ResponsiveContext._internal();

  factory ResponsiveContext({required BuildContext context})
  {
    responsiveContext.context = context;
    return responsiveContext;
  }
}
