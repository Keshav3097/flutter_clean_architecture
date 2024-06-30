
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import '../../../../core/responsive/responsive_width.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';

Widget headerTextWidget({required BuildContext context}) {
  String time = '${DateTime.now().day} ${(DateFormat.MMMM().format(
    DateTime.now(),
  )).substring(0, 3)} ${DateTime.now().year} | ${DateTime.now().hour}:${DateTime.now().minute}';
  return SizedBox(
    height: widgetSize(desktop: 10.h, tablet: 10.h, mobile: 13.h),
    width: widgetSize(desktop: 15.w, tablet: 15.w, mobile: 30.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'My Tasks',
          style: CustomJioTextStyle.textStyle700(
            fontSize: widgetSize(
              desktop: 15.sp,
              tablet: 15.sp,
              mobile: 16.sp,
            ),
            color: CustomColors.blackColor,
          ),
        ),
        Text(
          time,
          style: CustomJioTextStyle.textStyle700(
            fontSize: widgetSize(
              desktop: 14.sp,
              tablet: 14.sp,
              mobile: 15.sp,
            ),
            color: CustomColors.blackColor,
          ),
        ),
      ],
    ),
  );
}
