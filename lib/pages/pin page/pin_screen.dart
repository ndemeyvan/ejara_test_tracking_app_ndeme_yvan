import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../core/components/num_pad.dart';
import '../../core/constant/constants.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  // text controller
  final TextEditingController _pinCodeController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: getMediaQuery(context).width,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20.h,
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  EJARA_LOGO,
                  height: 90.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                PinCodeTextField(
                  isCupertino: false,
                  hideDefaultKeyboard: false,
                  autofocus: false,
                  controller: _pinCodeController,
                  hideCharacter: true,
                  highlight: true,
                  highlightColor: Colors.grey.withOpacity(0.3),
                  defaultBorderColor: Colors.grey.withOpacity(0.3),
                  hasTextBorderColor: Colors.grey.withOpacity(0.3),
                  highlightPinBoxColor: Colors.black,
                  maxLength: 4,
                  hasError: hasError,
                  onTextChanged: (text) {
                    setState(() {
                      hasError = false;
                    });
                  },
                  onDone: (text) {
                      print("DONE $text");
                  },
                  pinBoxWidth: 40,
                  pinBoxHeight: 24,
                  hasUnderline: false,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                  pinTextStyle: const TextStyle(fontSize: 22.0,color: Colors.red),
                  pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                  pinBoxColor: Colors.grey.withOpacity(0.3),
                  pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
                  highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.grey.withOpacity(0.3),
                  highlightAnimationEndColor: Colors.grey.withOpacity(0.3),
                  keyboardType: TextInputType.number,
                ),
                NumPad(
                  iconSize: 30,
                  buttonSize: 65.h,
                  iconColor: BLACKCOLOR,
                  controller: _pinCodeController,
                  delete: () {
                    if(_pinCodeController.text.isNotEmpty){
                      _pinCodeController.text = _pinCodeController.text
                          .substring(0, _pinCodeController.text.length - 1);
                      print("### This is the actual value : ${_pinCodeController.text}");
                    }
                  },
                  onSubmit: () {
                    debugPrint('Your code: ${_pinCodeController.text}');
                  },
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Vous avez oubliez votre code pin ?",
                      style: TextStyle(
                        color: BLACKCOLOR,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
