import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/tracking_button.dart';
import '../../../core/helpers/TrackingHelper.dart';
import '../../../core/routes/route_path.dart';
import '../../../core/theme/theme.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  TextEditingController codeConfirmationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateCodeValue(String? value) {
    var text = value ?? "";
    if (text.isEmpty) {
      return ("Le code de verification est requis");
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
      Navigator.pushNamed(context, transactionStatusScreen,
          arguments: {'description': "Test description", "isSuccess": false});
    } else {
      closeKeyBoard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 30.h,
                      )),
                  SizedBox(
                    width: 210.w,
                    child: Text(
                      "Confirmer le numéro",
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 70.h),
            Card(
              elevation: 0.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          "Code de confirmation",
                          style: TextStyle(
                              color: BLACKCOLOR,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                      TextFormField(
                        controller: codeConfirmationController,
                        style: TextStyle(
                            color: BLACKCOLOR, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: "0000",
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        validator: validateCodeValue,
                        obscureText: false,
                        onSaved: (String? val) {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w) +
                  EdgeInsets.only(bottom: 100.h),
              child: TrackingButton(
                onPressed: _validateInputs,
                title: "Continuer",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
