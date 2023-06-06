import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../core/components/num_pad.dart';
import '../../core/components/tracking_button.dart';
import '../../core/components/tracking_no_design_input.dart';
import '../../core/constant/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helpers/TrackingHelper.dart';
import '../bloc/amplitude_bloc.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  // text controller
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  String? validateAnswer(String? value) {
    var text = value ?? "";
    String message = "La description est requise";
    if (text.isEmpty) {
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "input/wrong_input",
          eventProperties: TrackingHelper.getErrorProperties(
              type: "input", message: message)));
      return message;
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
      BlocProvider.of<AmplitudeBloc>(context).add(
          AmplitudeEmitterEvent(eventName: "click/button_contact_support"));
    } else {
      closeKeyBoard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 20.h,
                        )),
                    Text(
                      "Contactez le support",
                      style: TextStyle(
                          color: BLACKCOLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                color: BLACKCOLOR,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp),
                          ),
                        ),
                        TrackingNoDesignInput(
                          fieldController: null,
                          validator: validateAnswer,
                          obscurText: false,
                          onChanged: (String? value) {},
                          placeholder: "Décrivez votre problème",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w) +
                EdgeInsets.only(bottom: 100.h),
            child: TrackingButton(
              onPressed: _validateInputs,
              title: "Contacter",
            ),
          ),
        ],
      )),
    );
  }
}
