
import 'package:auto_route/auto_route.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../../../../core/responsive/responsive_width.dart';
import '../../../../core/shared_widget/common widget.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_style.dart';
import 'package:flutter/material.dart';
import '../../../../core/user_preferences/user_preferences.dart';
import 'task_text_widget.dart';


Widget taskCardWidget({
  required String status,
  required String id,
  required String subject,
  required String raisedBy,
  required String raisedOn,
  required String assignedTo,
  required BuildContext context,
}) {
  return Container(
    height: widgetSize(desktop: 33.h, tablet: 32.h, mobile: 29.h),
    width: widgetSize(desktop: 28.w, tablet: 50.w, mobile: 60.w),
    // padding: EdgeInsets.only(left: 15.sp),
    margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
    decoration: BoxDecoration(
      color: CustomColors.lightGreenColor,
      borderRadius: BorderRadius.all(
        Radius.circular(15.sp),
      ),
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widgetSize(desktop: 0.5.w, tablet: 0.8.w, mobile: 1.w),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              status,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: CustomJioTextStyle.textStyle500(
                fontSize:
                    widgetSize(desktop: 12.sp, tablet: 14.sp, mobile: 15.sp),
                color: CustomColors.blackColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.sp),
                bottomRight: Radius.circular(15.sp),
              ),
              color: CustomColors.whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: widgetSize(desktop: 1.w, tablet: 2.w, mobile: 3.w),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          taskTextWidget(
                            displayText: 'Ticket ID',
                            value: id,
                            textColor: CustomColors.darkBlueTextColor,
                            isBold: true,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          taskTextWidget(
                            displayText: 'Subject',
                            value: subject,
                            textColor: CustomColors.darkBlueTextColor,
                            isBold: true,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert_outlined,
                        size: 15.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Divider(
                    thickness: 3,
                    color: CustomColors.greyColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  taskTextWidget(
                    displayText: 'Raised by',
                    value: raisedBy,
                    textColor: CustomColors.lightBlueTextColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 1.h,
                    spacing: 0,
                    runAlignment: WrapAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // taskTextWidget(displayText: 'Due Date', value: '02 Dec,
                      // 2023', textColor: CustomColors.lightBlueTextColor),
                      taskTextWidget(
                        displayText: 'Raised on',
                        value: raisedOn,
                        textColor: CustomColors.lightBlueTextColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  taskTextWidget(
                    displayText: 'Assigned To',
                    value: assignedTo,
                    textColor: CustomColors.lightBlueTextColor,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // taskTextWidget(displayText: 'Priority', value:
                      //'Critical (P1)', textColor: CustomColors.blackColor),
                      customButton(
                        onTap: () async {
                          await UserPreferences.setQueryId(id);

                          if (context.mounted) {
                            context.router.pushNamed('/details');
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TasksDetailsPage(),
                            //   ),
                            // );
                          }
                        },
                        buttonColor: CustomColors.buttonBlueColor,
                        text: 'View',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
