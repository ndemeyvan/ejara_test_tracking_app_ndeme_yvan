import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/merchant_single_row.dart';
import '../../../core/components/tracking_button.dart';
import '../../../core/components/tracking_no_design_input.dart';
import '../../../core/helpers/TrackingHelper.dart';
import '../../../core/routes/route_path.dart';
import '../../../core/theme/theme.dart';
import '../../bloc/amplitude_bloc.dart';

class AddNumberScreen extends StatefulWidget {
  const AddNumberScreen({Key? key}) : super(key: key);

  @override
  State<AddNumberScreen> createState() => _AddNumberScreenState();
}

class _AddNumberScreenState extends State<AddNumberScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatePhoneNumber(String? value) {
    var text = value ?? "";
    String message = "Le numero de telephone est requis";
    if (text.isEmpty) {
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "input/wrong_input",
          eventProperties: TrackingHelper.getErrorProperties(
              type: "input", message: message)));
      return message;
    }
    return null;
  }

  String? validateName(String? value) {
    var text = value ?? "";
    String message = "Le nom est requis";
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
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "Set Payment Method",
          eventProperties: TrackingHelper.getSetPaymentProperties(
              action: "ADD",
              operator: "MTN Mobile Money",
              previousOperator: "Orange Money")));
      Navigator.pushNamed(context, confirmationCodeScreen);
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
                      "Ajouter un numéro Mobile money",
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
                      // Operateur Mobile Money
                      MerchantSingleRow(
                        titleTextColor: BLACKCOLOR,
                        showDivider: false,
                        title: 'Operateur Mobile money',
                        subTitle: 'Orange',
                        onPressed: () {
                          BlocProvider.of<AmplitudeBloc>(context).add(
                              AmplitudeEmitterEvent(
                                  eventName: "click/button_merchant_option"));
                          Navigator.pushNamed(context, merchantOperator);
                        },
                      ),
                      // Phone Number
                      const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          "Numéro de telephone",
                          style: TextStyle(
                              color: BLACKCOLOR,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                      TrackingNoDesignInput(
                        fieldController: phoneNumberController,
                        validator: validatePhoneNumber,
                        obscurText: false,
                        onChanged: (String? value) {},
                        placeholder: "+237 656209008",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // Nom complet
                      const Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Text(
                          "Nom complet",
                          style: TextStyle(
                              color: BLACKCOLOR,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                      TrackingNoDesignInput(
                        fieldController: nameController,
                        validator: validateName,
                        obscurText: false,
                        onChanged: (String? value) {},
                        placeholder: "Ndeme Yvan",
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
