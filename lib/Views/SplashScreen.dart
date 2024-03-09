import 'dart:async';

import 'package:aarcon/Core/assets.dart';
import 'package:aarcon/Core/colors_constant.dart';
import 'package:aarcon/Views/LoginScreen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () async {
      Get.offAll(const LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        color: white,
        child: Center(
          child:
              // Image.asset(
              //   Asset.appLogo,
              //   height: 5.h,
              //   fit: BoxFit.cover,
              // ),

              FadeInLeft(
            duration: const Duration(milliseconds: 1000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Asset.logoSvg,
                  fit: BoxFit.cover,
                  height: 5.h,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: 1.w,
                  height: 6.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: black),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "Aarcon",
                  style: TextStyle(fontSize: 30.sp, color: secondaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
