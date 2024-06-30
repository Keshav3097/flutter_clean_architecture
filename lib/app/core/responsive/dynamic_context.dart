import 'package:flutter/cupertino.dart';

class DynamicContext {
  late BuildContext ctx;
  setContext({required BuildContext context})
  {
    ctx = context;
  }
  getContext()
  {
    return ctx;
  }
}