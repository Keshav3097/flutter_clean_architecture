

import 'package:flutter/material.dart';
import 'package:qms_admin/app/core/responsive/responsive_sizer/responsive_sizer.dart';

import '../constants/custom_strings.dart';
import '../responsive/responsive.dart';
import '../responsive/responsive_width.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget body;

  const ScaffoldWrapper({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: CustomColors.whiteColor,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: CustomColors.darkBlueColor,
          centerTitle: Responsive.isDesktop() ? true : false,
          title: Padding(
            padding: EdgeInsets.only(left: 20.sp),
            child: Row(
              children: [
                // Image.asset(
                //   AssetsPath.jioIcon,
                //   height:
                //       widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
                //   width:
                //       widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
                //   fit: BoxFit.fill,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Text(
                    'Swayam',
                    maxLines: 2,
                    style: CustomJioTextStyle.textStyle900(
                      fontSize: widgetSize(
                        desktop: 14.sp,
                        tablet: 15.sp,
                        mobile: 17.sp,
                      ),
                      color: CustomColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return const Dialog(
                //       alignment: Alignment.topRight,
                //       child: Profile(),
                //     );
                //   },
                // );
              },
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: widgetSize(
                  desktop: 14.sp,
                  tablet: 14.sp,
                  mobile: 14.sp,
                ),
                //  backgroundImage: const AssetImage("assets/png_icons/avatar.png"),//Text
                child: Icon(
                  Icons.person,
                  size: widgetSize(
                    desktop: 14.sp,
                    tablet: 14.sp,
                    mobile: 14.sp,
                  ),
                  color: CustomColors.whiteColor,
                ),
              ),
            ),
            // SizedBox(
            //   height:
            //       widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
            //   width: 
            //widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
            //   child: Image.asset(
            //     AssetsPath.profileImage,
            //     height:
            //         widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
            //     width:
            //         widgetSize(desktop: 20.sp, tablet: 25.sp, mobile: 25.sp),
            //     // fit: BoxFit.fill,
            //   ),
            // ),
            SizedBox(width: 5.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Card(
            elevation: 5,
            shadowColor: CustomColors.whiteColor,
            color: CustomColors.greyColor,
            surfaceTintColor: CustomColors.greyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widgetSize(
                  desktop: 20.sp,
                  tablet: 20.sp,
                  mobile: 20.sp,
                ),
              ),
            ),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: body,
              ),
            ),
          ),
          // Container(
          //   height: 80.h,
          //   width: 85.w,
          //     decoration:const  BoxDecoration(
          //       color: CustomColors.greyColor,
          //       borderRadius: BorderRadius.all(Radius.circular(40),)
          //     ),
          //     child: body),
        ),
        // bottomNavigationBar: FooterWidget(
        //   footerConfig: FooterConfig(
        //       appVersion: CustomStrings.version,
        //       footerAlignment: FooterAlignment.bottom,
        //       footerColor: CustomColors.darkBlueColor,
        //       isFlutterEnable: true,),
        // ),
      ),
    );
  }
}