import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../animation/fade_animation.dart';
import '../theme/style.dart';
import '../theme/theme.dart';

class OptionChoiceTitle extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String subTitle;
  final bool showTitle;
  final bool isChecked;
  final double? heightButton;

  const OptionChoiceTitle({Key? key,required this.onPressed,required this.isChecked,required this.subTitle,required this.showTitle,required this.title, this.heightButton}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return BLACKCOLOR;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child:  FadeAnimation(0.5,Container(
        width: screenWidth(context),
        padding: const EdgeInsets.all(15) +
            const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Grey Title
                    showTitle ? Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ):const SizedBox(),
                    // Black Title
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onPressed,
                  behavior: HitTestBehavior.translucent,
                  child: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      onPressed!();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}