


import 'package:flutter/material.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/responsive/responsive_width.dart';

import '../../../../core/utils/text_style.dart';

Widget filterWidget(){
  return  GestureDetector(
    onTap: () {},
    child: Row(
      children: [
        Icon(
          Icons.filter_list_sharp,
          size: widgetSize(
              desktop: 14.sp,
              tablet: 14.5.sp,
              mobile: 15.sp,),
        ),
        SizedBox(
          width: 0.5.w,
        ),
        Text('Filters',
          style: CustomJioTextStyle
              .textStyle700(
            color: CustomColors
                .blackColor,
            fontSize: widgetSize(
                desktop: 14.sp,
                tablet: 14.5.sp,
                mobile: 15.sp,),),),
      ],
    ),
  );
}