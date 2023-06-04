import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';

//--------------------------- screen height & width ----------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//--------------------------- Text styles --------------------------------------

TextStyle errorTextFieldStyle(context) {
  return Theme.of(context).textTheme.caption!.copyWith(color: Theme.of(context).errorColor);
}

TextStyle titleText() {
  return TextStyle(
    color: BLACKCOLOR,
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
  );
}
