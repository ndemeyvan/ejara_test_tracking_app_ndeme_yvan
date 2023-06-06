// define NumberButton widget
// its shape is round
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: TextButton(
            onPressed: () {
              if(controller.text.length<4){
                controller.text += number.toString();
              }
            },
            child: Text(
              number.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: BLACKCOLOR, fontSize: 25.sp),
            )),
      ),
    );
  }
}
