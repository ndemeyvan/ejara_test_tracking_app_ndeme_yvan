import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';


class ChipsButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;


  const ChipsButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text("$text",style: TextStyle(
              color: BLACKCOLOR,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),),
        ),
      ),
    );
  }
}




