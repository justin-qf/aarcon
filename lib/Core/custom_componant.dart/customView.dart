import 'package:aarcon/Core/colors_constant.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'dart:io' show Platform;

bool Click = true;
bool White = true;
bool Black = true;

getTitle(String title) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(
            color: black,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 13.sp,
            fontWeight: FontWeight.w700),
      ),
      SizedBox(
        height: 0.5.h,
      ),
    ],
  );
}

getButton(
  Function fun,
) {
  return FadeInUp(
    child: ElevatedButton(
        onPressed: () {
          fun();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          "Submit",
          style: TextStyle(
              color: Colors.white,
              fontSize: 14.5.sp,
              fontWeight: FontWeight.w700),
        )),
  );
}

getMiniButton(
  Function fun,
  str,
) {
  return InkWell(
    onTap: () {
      fun();
    },
    child: Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 5.h : 4.5.h,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 1),
      width: SizerUtil.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: lightPrimaryColor,
        boxShadow: [
          BoxShadow(
              color: primaryColor.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 1),
              spreadRadius: 3.0)
        ],
      ),
      child: Text(
        str,
        style: TextStyle(
            color: Colors.white,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 8.sp),
      ),
    ),
  );
}

getFormButton(Function fun, str, {required bool validate}) {
  return InkWell(
    onTap: () {
      fun();
    },
    child: Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 6.h : 5.9.h,
      alignment: Alignment.center,
      //  padding: EdgeInsets.only(top: 1.h),
      width: SizerUtil.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            SizerUtil.deviceType == DeviceType.mobile ? 5.h : 1.4.h),
        color: validate ? white : black,
        boxShadow: [
          BoxShadow(
              color: validate
                  ? primaryColor.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.2),
              blurRadius: 10.0,
              offset: const Offset(0, 1),
              spreadRadius: 3.0)
        ],
      ),
      child: Text(
        str,
        style: TextStyle(
            color: white,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 14.sp : 8.sp),
      ),
    ),
  );
}

getPaddingFromStatusBar() {
  return SizedBox(
    height: Platform.isAndroid ? 3.5.h : 0,
  );
}

getBackNav(Function fun) {
  return GestureDetector(
    onTap: () {
      fun();
    },
    child: Container(
      margin: EdgeInsets.only(left: 4.w),
      padding: const EdgeInsets.all(10),
      child: Icon(
        Icons.arrow_back,
        size: SizerUtil.deviceType == DeviceType.mobile ? 6.w : 5.w,
      ),
    ),
  );
}
