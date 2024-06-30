
import 'package:flutter/material.dart';
import 'colors.dart';

class StyleConstant {
  StyleConstant._();
  static const String init = 'init';
  static final textFieldOutLineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
  );
  static final textFieldDefaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: CustomColors.fieldBorderColor),
  );
  static final textFieldEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: CustomColors.fieldBorderColor),
  );
  static final textFieldFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: CustomColors.fieldBorderColor),
  );
  static final textFieldErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColors.redColor),
    borderRadius: BorderRadius.circular(10),
  );
  static final textFieldDisabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: CustomColors.fieldBorderColor),
  );
  static final textFieldFocusedErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColors.redColor),
    borderRadius: BorderRadius.circular(10),
  );
  static const textFieldContentPadding = EdgeInsets.symmetric(
    vertical: 8,
    horizontal: 12,
  );
  static final searchTextFieldOutLineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: CustomColors.fieldBorderColor,
    ),
  );
}