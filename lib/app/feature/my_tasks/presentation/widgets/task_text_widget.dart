
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../../../../core/responsive/responsive_width.dart';
import '../../../../core/utils/text_style.dart';
import 'package:flutter/material.dart';

Widget taskTextWidget(
    {required String displayText,
    required String value,
    required Color textColor,
    bool isBold = false,}) {
  return Row(
    children: [
      Text(
        '$displayText: ',
        style: isBold
            ? CustomJioTextStyle.textStyle700(
                color: textColor,
                fontSize:
                    widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
              )
            : CustomJioTextStyle.textStyle500(
                color: textColor,
                fontSize:
                    widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
              ),
      ),
      Text(
        value,
        overflow: TextOverflow.ellipsis,
        // maxLines: 2,
        style: isBold
            ? CustomJioTextStyle.textStyle700(
                color: textColor,
                fontSize:
                    widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
              )
            : CustomJioTextStyle.textStyle300(
                color: textColor,
                fontSize:
                    widgetSize(desktop: 12.sp, tablet: 13.sp, mobile: 14.sp),
              ),
      ),
    ],
  );
}