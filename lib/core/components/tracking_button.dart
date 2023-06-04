import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import '../theme/style.dart';
import '../theme/theme.dart';

class TrackingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? heightButton;

  TrackingButton({Key? key,required this.onPressed,required this.title, this.heightButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FadeAnimation(0.3,Container(
        height: heightButton,
        padding: EdgeInsets.all(15),
        width: screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: BLACKCOLOR,
        ),
        child: Center(
            child: Text(
              title,
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18.sp),
            )),
      )),
    );
  }
}