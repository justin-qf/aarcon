import 'package:aarcon/Controllers/LoginScreenController.dart';
import 'package:aarcon/Core/colors_constant.dart';
import 'package:aarcon/Core/custom_componant.dart/customView.dart';
import 'package:aarcon/Core/custom_componant.dart/form_input.dart';
import 'package:aarcon/Views/HomeScreen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginScreenController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // Show the dialog after the frame has been rendered
    //   _showInitialDialog();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // Common().trasparent_statusbar();

    return GestureDetector(
        onTap: () {
          controller.hideKeyboard(context);
        },
        child: Scaffold(
          backgroundColor: white,
          // resizeToAvoidBottomInset: false,
          body: Stack(children: [
            SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 7.0.w, right: 7.0.w, top: 8.h, bottom: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInDown(
                        from: 50,
                        child: Text(
                          "AARCON",
                          style: TextStyle(
                            color: black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: FadeInDown(
                          from: 50,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            getTitle('Email ID'),
                            FadeInUp(
                                from: 30,
                                child: AnimatedSize(
                                    duration: const Duration(milliseconds: 300),
                                    child: Obx(() {
                                      return getReactiveFormField(
                                        node: controller.emailNode,
                                        controller: controller.emailctr,
                                        hintLabel: "Enter Email ID",
                                        onChanged: (val) {
                                          controller.validateEmail(val);
                                        },
                                        errorText:
                                            controller.emailModel.value.error,
                                        inputType: TextInputType.text,
                                      );
                                    }))),
                            getTitle("Password"),
                            FadeInUp(
                                from: 30,
                                child: AnimatedSize(
                                    duration: const Duration(milliseconds: 300),
                                    child: Obx(() {
                                      return getReactiveFormField(
                                        node: controller.passNode,
                                        controller: controller.passctr,
                                        hintLabel: "Enter Password",
                                        wantSuffix: true,
                                        isPassword: true,
                                        onChanged: (val) {
                                          controller.validatePassword(val);
                                        },
                                        fromObsecureText: "LOGIN",
                                        errorText:
                                            controller.passModel.value.error,
                                        inputType: TextInputType.text,
                                      );
                                    })))
                          ]),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          InkWell(
                            onTap: () {
                              // Get.to(EmailScreen());
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.to(const HomeScreen());
                        },
                        child: Container(
                          width: 40.w,
                          height: 6.h,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: black),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(color: white, fontSize: 15.sp),
                          )),
                        ),
                      )
                      // FadeInUp(
                      //     from: 50,
                      //     child: Obx(() {
                      //       return getFormButton(() {
                      //         if (controller.isFormInvalidate.value == true) {
                      //           Get.to(const HomeScreen());
                      //         }
                      //       }, "Sign In",
                      //           validate: controller.isFormInvalidate.value);
                      //     })),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
