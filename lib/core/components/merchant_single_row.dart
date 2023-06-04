import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/animation/fade_animation.dart';

import '../theme/theme.dart';

class MerchantSingleRow extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final String? subTitle;
  final bool showDivider;
  final Color titleTextColor;

  const MerchantSingleRow({
    Key? key,
    required this.title,
    this.showDivider = true,
    this.titleTextColor = Colors.grey,
    required this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        0.3,
        Column(
          children: [
            showDivider
                ? const Divider(
                    color: Colors.grey,
                    height: 1,
                  )
                : SizedBox(),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: onPressed,
              behavior: HitTestBehavior.translucent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          "$title",
                          style: TextStyle(
                              color: titleTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp),
                        ),
                      ),
                      SizedBox(height: 13.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          "$subTitle",
                          style: TextStyle(
                              color: BLACKCOLOR,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 30,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ));
  }
}
