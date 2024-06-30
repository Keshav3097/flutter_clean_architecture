

import 'package:flutter/material.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';
import '../../../../core/responsive/responsive_width.dart';
import '../../../../core/utils/text_style.dart';
import '../../domain/entities/my_tasks_entity.dart';
import '../widgets/header_text_widget.dart';
import '../../../../core/utils/colors.dart';
import '../widgets/query_count_card.dart';
import '../widgets/task_card_widget.dart';

Widget buildMyTaskWidget({
  required int totalPages,
  required int pageNumber,
  required ScrollController scrollController,
  required BuildContext context,
  required MyTasksEntity myTasksEntity,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: widgetSize(
          desktop: 6.h,
          tablet: 6.h,
          mobile: 3.h,
        ),
      ),
// Responsive.isMobile()
//     ? Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: 2.5.w),
//             child: headerTextWidget(context: context),
//           ),
//           Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.spaceEvenly,
//             children: state.myTasksEntity!.queriesCount
//                 .map((data) {
//               if (data.value != '') {
//                 return queryCountCard(
//                     count: data.value,
//                     displayText: data.displayText);
//               } else {
//                 return const SizedBox();
//               }
//             }).toList(),
//           )
//         ],
//       ) :
      Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widgetSize(
                desktop: 6.w,
                tablet: 5.w,
                mobile: 3.w,
              ),
            ),
            child: headerTextWidget(context: context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
// [
//   queryCountCard(
//       count: '21',
//       displayText: 'Tasks Assigned'),
//   queryCountCard(
//       count: '3', displayText: 'Tasks Overdue'),
//   queryCountCard(
//       count: '6', displayText: 'High Priority'),
// ]
                myTasksEntity.queriesCount.map((data) {
              if (data.value != '') {
                return queryCountCard(
                  count: data.value,
                  displayText: data.displayText,
                );
              } else {
                return const SizedBox();
              }
            }).toList(),
          ),
        ],
      ),
      SizedBox(
        height: widgetSize(
          desktop: 3.h,
          tablet: 3.h,
          mobile: 1.h,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widgetSize(
            desktop: 5.w,
            tablet: 4.w,
            mobile: 2.w,
          ),
          vertical: 2.h,
        ),
        child: Card(
          elevation: 5,
          shadowColor: CustomColors.greyColor,
          color: CustomColors.whiteColor,
          surfaceTintColor: CustomColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              widgetSize(
                desktop: 20.sp,
                tablet: 20.sp,
                mobile: 20.sp,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: widgetSize(
                desktop: 4.h,
                tablet: 4.h,
                mobile: 4.h,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Tasks',
                      style: CustomJioTextStyle.textStyle700(
                        color: CustomColors.blackColor,
                        fontSize: widgetSize(
                          desktop: 14.sp,
                          tablet: 14.5.sp,
                          mobile: 15.sp,
                        ),
                      ),
                    ),
// filterWidget(),
                  ],
                ),
                SizedBox(
                  height: widgetSize(
                    desktop: 2.h,
                    tablet: 2.h,
                    mobile: 1.h,
                  ),
                ),
                const Divider(thickness: 2),
                SizedBox(
                  height: widgetSize(
                    desktop: 3.h,
                    tablet: 3.h,
                    mobile: 1.h,
                  ),
                ),
                SizedBox(
                  height: widgetSize(
                    desktop: 60.h,
                    tablet: 60.h,
                    mobile: 60.h,
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        Wrap(
                          children: myTasksEntity.queries
                              .map(
                                (data) => taskCardWidget(
                                  status: data.status,
                                  context: context,
                                  id: data.id,
                                  assignedTo: data.assignedTo,
                                  raisedBy: data.raisedBy,
                                  raisedOn: data.raisedOn,
                                  subject: data.subject,
                                ),
                              )
                              .toList(),
                        ),
                        if (pageNumber < totalPages)
                          const SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}