import 'package:aarcon/Controllers/HomeScreenController.dart';
import 'package:aarcon/Core/colors_constant.dart';
import 'package:aarcon/Core/custom_componant.dart/customView.dart';
import 'package:aarcon/Core/custom_componant.dart/form_input.dart';
import 'package:aarcon/Core/strings.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TimeOfDay selectedTime;

  var controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("AARCON"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 8.w, right: 8.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getTitle('Invitee Name'),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.nameNode,
                            controller: controller.nameCtr,
                            hintLabel: "Enter Name",
                            onChanged: (val) {
                              controller.validateName(val);
                            },
                            errorText: controller.nameModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                getTitle("Event Name"),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.eventNode,
                            controller: controller.eventCtr,
                            hintLabel: "Select Event",
                            wantSuffix: true,
                            isDropdown: true,
                            onChanged: (val) {
                              controller.validateEvent(val);
                            },
                            onTap: () {
                              controller.eventCtr.text = "";
                              // if (controller
                              //     .subCategoryctr.text.isEmpty) {
                              //   return PopupDialogs(
                              //     context,
                              //     "Service",
                              //     "Category Field and Sub Category Field is Required",
                              //   );
                              // }

                              // showDropDownDialog(context,
                              //     controller.setServiceList(), "Service List");
                            },
                            errorText: controller.eventModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                getTitle("Date"),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.dateNode,
                            controller: controller.dateCtr,
                            hintLabel: "Select Date",
                            wantSuffix: true,
                            isCalender: true,
                            isReadOnly: true,
                            onChanged: (val) {
                              controller.validateDate(val);
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: primaryColor,
                                        backgroundColor: white,
                                        buttonTheme: ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50), // Set your border radius
                                          ),
                                        ),
                                        useMaterial3: true,
                                        colorScheme: const ColorScheme.light(
                                          primary: Colors
                                              .teal, // Set your primary color
                                        ).copyWith(secondary: secondaryColor),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: controller.selectedDate,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 0)));
                              if (pickedDate != null &&
                                  pickedDate != controller.selectedDate) {
                                setState(() {
                                  controller.selectedDate = pickedDate;
                                });
                              }
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat(Strings.oldDateFormat)
                                        .format(pickedDate);
                                controller.updateDate(formattedDate);
                                controller.validateDate(formattedDate);
                              }
                            },
                            errorText: controller.dateModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                getTitle("Time"),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.timeNode,
                            controller: controller.timeCtr,
                            hintLabel: "Select Time",
                            wantSuffix: true,
                            isReadOnly: true,
                            time: true,
                            onChanged: (val) {
                              controller.validateTime(val);
                            },
                            onTap: () async {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: white,
                                      backgroundColor: white,
                                      buttonTheme: ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50), // Set your border radius
                                        ),
                                      ),
                                      useMaterial3: true,
                                      colorScheme: const ColorScheme.light(
                                        primary: Colors
                                            .teal, // Set your primary color
                                      ).copyWith(secondary: secondaryColor),
                                    ),
                                    child: child!,
                                  );
                                },
                                initialTime: TimeOfDay.now(),
                              );

                              if (pickedTime != null) {
                                final DateTime currentDate = DateTime.now();
                                final DateTime combinedDateTime = DateTime(
                                  currentDate.year,
                                  currentDate.month,
                                  currentDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                  0,
                                  704,
                                );

                                final formattedDateTime =
                                    "${pickedTime.format(context)}";

                                //For All Format
                                controller.approxTime =
                                    "${DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(combinedDateTime)}Z";

                                controller.updateApproxtime(formattedDateTime);
                                controller.validateTime(formattedDateTime);
                                setState(() {
                                  selectedTime = pickedTime;
                                  print("Selected Time: $formattedDateTime");
                                });
                              }
                            },
                            errorText: controller.timeModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                getTitle("Matter"),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.matterNode,
                            controller: controller.matterCtr,
                            hintLabel: "Enter Matter",
                            onChanged: (val) {
                              controller.validateMatter(val);
                            },
                            errorText: controller.matterModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                getTitle("Note"),
                FadeInUp(
                    from: 30,
                    child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: Obx(() {
                          return getReactiveFormField(
                            node: controller.noteNode,
                            controller: controller.noteCtr,
                            hintLabel: "Enter Node",
                            onChanged: (val) {
                              controller.validateNote(val);
                            },
                            isExpand: true,
                            errorText: controller.noteModel.value.error,
                            inputType: TextInputType.text,
                          );
                        }))),
                SizedBox(
                  height: 4.h,
                ),
                FadeInUp(
                    from: 50,
                    child: Obx(() {
                      return getFormButton(() {
                        if (controller.isFormInvalidate.value == true) {
                          // controller.signInAPI(context);
                        }
                      }, "Sign In",
                          validate: controller.isFormInvalidate.value);
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
