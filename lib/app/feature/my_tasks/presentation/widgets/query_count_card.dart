import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../../../../core/responsive/responsive_width.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import 'package:flutter/material.dart';

Widget queryCountCard({required String displayText, required String count}) {
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: widgetSize(desktop: 1.w, tablet: 1.w, mobile: 1.5.w),
    ),
    height: widgetSize(desktop: 10.h, tablet: 10.h, mobile: 8.h),
    width: widgetSize(desktop: 20.w, tablet: 20.w, mobile: 26.w),
    decoration: BoxDecoration(
      color: CustomColors.whiteColor,
      borderRadius: BorderRadius.all(
        Radius.circular(
          widgetSize(desktop: 15.sp, tablet: 15.sp, mobile: 15.sp),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          displayText,
          style: CustomJioTextStyle.textStyle700(
            color: CustomColors.blackColor,
            fontSize: widgetSize(desktop: 14.sp, tablet: 14.sp, mobile: 14.sp),
          ),
        ),
        Container(
          height: widgetSize(desktop: 8.h, tablet: 8.h, mobile: 6.h),
          width: widgetSize(desktop: 6.w, tablet: 6.w, mobile: 6.w),
          decoration: BoxDecoration(
            color: CustomColors.peachColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                widgetSize(desktop: 13.sp, tablet: 12.sp, mobile: 12.sp),
              ),
            ),
          ),
          child: Center(
            child: Text(
              count,
              style: CustomJioTextStyle.textStyle700(
                color: CustomColors.blackColor,
                fontSize:
                    widgetSize(desktop: 14.sp, tablet: 14.sp, mobile: 14.5.sp),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}