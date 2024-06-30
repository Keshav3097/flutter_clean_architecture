
import 'package:flutter/material.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../responsive/responsive_width.dart';
import 'colors.dart';

class CustomJioTextStyle {


  static TextStyle textStyle100(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color, }) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w100,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle200(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w200,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle300(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w300,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }


  static TextStyle textStyle400(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w400,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle500(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w500,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }


  static TextStyle textStyle600(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w600,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle700(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w700,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle800(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w800,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle textStyle900(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.w900,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }


  static TextStyle textStyleBolt(
      {double? fontSize,FontStyle fontStyle = FontStyle.normal,Color? color}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: color ?? CustomColors.rgba0001,
        fontWeight: FontWeight.bold,
        fontFamily: 'JioType',
        fontStyle: fontStyle,
        decoration: TextDecoration.none);
  }

  static TextStyle controlTextStyle(
      {double? fontSize}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: CustomColors.rgba0001,
        fontWeight: FontWeight.normal,
        fontFamily: 'JioType',
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none);
  }
  static TextStyle controlHintTextStyle(
      {double? fontSize}) {
    return TextStyle(
        fontSize: fontSize ?? widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
        color: CustomColors.rgba8989891,
        fontWeight: FontWeight.normal,
        fontFamily: 'JioType',
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none);
  }
}