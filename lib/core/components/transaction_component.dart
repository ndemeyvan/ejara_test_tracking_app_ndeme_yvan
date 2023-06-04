import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../animation/fade_animation.dart';
import '../helpers/TrackingHelper.dart';
import '../theme/theme.dart';

class TrackingItemComponent extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double amount;
  final String date;

  const TrackingItemComponent(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.amount,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FadeAnimation(
          0.4,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp),
                    ),
                    Text(
                      "${TrackingHelper.formatAmount(amount)}f",
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8), fontSize: 14.sp),
                ),
              ],
            ),
          )),
    );
  }
}
