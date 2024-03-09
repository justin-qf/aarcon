import 'package:aarcon/Core/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

styleTextForFieldLabel(FocusNode node) {
  return TextStyle(
    color: Color(0xFF262C2E),
    fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 6.sp,
  );
}

styleTextForFieldHint() {
  return TextStyle(fontSize: 11.sp, color: black);
}

styleTextForErrorFieldHint() {
  return TextStyle(fontSize: 11.sp, color: red);
}

styleTextFormFieldText() {
  return TextStyle(
      fontSize: SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 7.sp,
      color: Color(0xFF262C2E));
}

TextStyle styleForSecondaryText() {
  return TextStyle(
      fontSize: 10.sp,
      color: lightAccentColor,
      decoration: TextDecoration.underline);
}

styleTextForField() {
  return TextStyle(
      fontSize: 11.sp, color: lightAccentColor, fontWeight: FontWeight.bold);
}

TextStyle styleForTextWithUnderline() {
  return TextStyle(
      fontSize: 10.sp,
      color: lightAccentColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);
}
