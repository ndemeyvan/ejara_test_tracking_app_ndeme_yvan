// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'num_button.dart';

class NumPad extends StatelessWidget {
  final double buttonSize;
  final double iconSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.iconSize = 30,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // implement the number keys (from 0 to 9) with the NumberButton widget
          // the NumberButton widget is defined in the bottom of this file
          children: [
            NumberButton(
              number: 1,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 2,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 3,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 4,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 5,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 6,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberButton(
              number: 7,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 8,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            NumberButton(
              number: 9,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // this button is used to submit the entered value
            IconButton(
              onPressed: () => onSubmit(),
              icon: Icon(
                Icons.done_rounded,
                color: iconColor,
                size: iconSize,
              ),
              iconSize: buttonSize,
            ),
            NumberButton(
              number: 0,
              size: buttonSize,
              color: buttonColor,
              controller: controller,
            ),
            // this button is used to delete the last number
            IconButton(
              onPressed: () => delete(),
              icon: Icon(
                Icons.backspace,
                color: iconColor,
                size: iconSize,
              ),
              iconSize: iconSize,
            ),
          ],
        ),
      ],
    );
  }
}