import 'package:aarcon/Controllers/LoginScreenController.dart';
import 'package:aarcon/Core/assets.dart';
import 'package:aarcon/Core/colors_constant.dart';
import 'package:aarcon/Core/custom_componant.dart/form_input.dart';
import 'package:aarcon/Core/theme/style.dart';
import 'package:aarcon/Utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField(
      {Key? key,
      required this.hintText,
      required this.errorText,
      this.onChanged,
      this.validator,
      this.title,
      this.inputFormatters,
      required this.inputType,
      required this.node,
      this.controller,
      this.formType,
      this.isExpand,
      this.isVerified,
      this.time,
      this.isPhoto,
      this.isDropdown,
      this.onAddBtn,
      this.isCalender,
      this.isHidden,
      this.wantSuffix,
      this.onVerifiyButtonClick,
      this.isDataValidated,
      this.onTap,
      this.isdown,
      this.isReadOnly,
      this.isPick,
      this.isAdd,
      this.isPassword,
      this.fromObsecureText,
      this.index,
      this.isFromAddStory = false,
      this.isEnable = true})
      : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final FieldType? formType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? title;
  final FocusNode node;
  final Function(String?)? onChanged;
  final bool? isExpand;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool? isVerified;
  final bool? isPick;
  final bool? time;
  final bool? isDropdown;
  final Function? onAddBtn;
  final bool? isReadOnly;
  final bool? isPhoto;
  final bool? isPassword;
  final bool? isCalender;
  final Function? onVerifiyButtonClick;
  final bool? wantSuffix;
  final bool? isHidden;
  final bool? isDataValidated;
  final bool? isAdd;
  final bool? isdown;
  final String? fromObsecureText;
  final Function? onTap;
  bool isEnable = true;
  final String? index;
  bool isFromAddStory = false;
  bool obsecuretext = false;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnable,
      cursorColor: primaryColor,
      readOnly:
          widget.isCalender == true || widget.isReadOnly == true ? true : false,
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      obscureText: widget.fromObsecureText == "LOGIN"
          ? Get.find<LoginScreenController>().obsecureText.value
          : widget.obsecuretext,
      textInputAction: TextInputAction.next,
      keyboardType: widget.inputType,
      validator: widget.validator,
      controller: widget.controller,
      maxLength: widget.inputType == TextInputType.number ? 16 : null,
      style: widget.isFromAddStory
          ? TextStyle(
              // fontFamily: fontRegular,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 8.sp,
              color: black)
          : styleTextFormFieldText(),
      textAlignVertical: TextAlignVertical.center,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelStyle: styleTextForFieldLabel(widget.node),
        contentPadding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            top: SizerUtil.deviceType == DeviceType.mobile
                ? widget.isExpand!
                    ? 10.h
                    : 0.w
                : 3.w,
            bottom: SizerUtil.deviceType == DeviceType.mobile ? 0.w : 3.w),
        //EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 5.w),
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: styleTextForErrorFieldHint(),
        hintStyle: styleTextForFieldHint(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: inputBorderColor,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
          borderRadius: BorderRadius.circular(30),
        ),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: inputBorderColor,
          ),
        ),
        // prefixStyle: styleTextFormFieldText(),
        prefixIcon: widget.formType != null &&
                widget.formType == FieldType.Mobile
            ? Container(
                padding: const EdgeInsets.only(left: 16, bottom: 3, right: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("+91", style: styleTextFormFieldText()),
                  ],
                ),
              )
            : null,
        prefixIconConstraints:
            const BoxConstraints(minHeight: 25, maxHeight: 30),
        suffixIcon: widget.wantSuffix == true
            ? GestureDetector(
                onTap: () {
                  if (widget.fromObsecureText == "LOGIN") {
                    Get.find<LoginScreenController>().obsecureText.value =
                        !Get.find<LoginScreenController>().obsecureText.value;
                    setState(() {});
                  } else if (widget.fromObsecureText == "UPDATE VENDOR") {
                  } else {
                    _togglePasswordView(context);
                  }
                },
                child: widget.time == true
                    ? SvgPicture.asset(Asset.time,
                        height: 7, width: 7, fit: BoxFit.scaleDown)
                    : widget.isDropdown == true
                        ? Row(
                            mainAxisSize: MainAxisSize.min, // added line
                            children: [
                              IconButton(
                                alignment: Alignment.centerRight,
                                onPressed: () {
                                  if (widget.onTap != null) widget.onTap!();
                                },

                                icon: SvgPicture.asset(
                                  Asset.dropdown,
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.scaleDown,
                                ),
                                // iconSize:
                                //     SizerUtil.deviceType == DeviceType.mobile
                                //         ? 30
                                //         : 40,
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                          )
                        : widget.isCalender == true
                            ? Icon(Icons.calendar_today)

                            //  SvgPicture.asset(
                            //     Asset.calender,
                            //     height: 5,
                            //     width: 5,
                            //     fit: BoxFit.scaleDown,
                            //     color: Colors.grey,
                            //   )
                            : InkWell(
                                child: widget.isPassword == true
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            right: SizerUtil.deviceType ==
                                                    DeviceType.mobile
                                                ? 0.w
                                                : 3.w),
                                        child: Icon(
                                          widget.fromObsecureText == "LOGIN"
                                              ? Get.find<LoginScreenController>()
                                                      .obsecureText
                                                      .value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility
                                              : widget.obsecuretext
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                          color: Colors.grey,
                                          size: SizerUtil.deviceType ==
                                                  DeviceType.mobile
                                              ? 20.sp
                                              : 15.sp,
                                        ),
                                      )
                                    : IconButton(
                                        alignment: Alignment.centerRight,
                                        onPressed: () {
                                          if (widget.onTap != null)
                                            widget.onTap!();
                                        },
                                        padding: EdgeInsets.only(
                                            left:
                                                widget.isAdd == true ? 5.w : 0),
                                        icon: const Icon(Icons.remove_red_eye),

                                        //  SvgPicture.asset(
                                        //   Asset.dropdown,
                                        //   height: 30,
                                        //   width: 30,
                                        //   fit: BoxFit.scaleDown,
                                        // ),
                                        // iconSize:
                                        //     SizerUtil.deviceType == DeviceType.mobile
                                        //         ? 30
                                        //         : 40,
                                        color: Colors.black.withOpacity(0.2),
                                      ),

                                //  SvgPicture.asset(Asset.photos,
                                //     height: 5, width: 5, fit: BoxFit.scaleDown),
                              ))
            : Container(
                width: 1,
              ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
    );
  }

  void _togglePasswordView(BuildContext context) {
    setState(() {
      widget.obsecuretext = !widget.obsecuretext;
    });
  }
}
