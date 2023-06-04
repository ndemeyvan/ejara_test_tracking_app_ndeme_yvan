import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/merchant_single_row.dart';
import '../../../core/components/tracking_button.dart';
import '../../../core/helpers/TrackingHelper.dart';
import '../../../core/routes/route_path.dart';
import '../../../core/theme/theme.dart';

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
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Le numero de telephone est requis");
    }
    return null;
  }

  String? validateName(String? value) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Le nom est requis");
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
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
                      TextFormField(
                        controller: phoneNumberController,
                        style: TextStyle(
                            color: BLACKCOLOR, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          isDense: true,
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: "+237 656209008",
                          focusedBorder: OutlineInputBorder(
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
                        validator: validatePhoneNumber,
                        obscureText: false,
                        onSaved: (String? val) {},
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
                      TextFormField(
                        controller: nameController,
                        style: TextStyle(
                            color: BLACKCOLOR, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          isDense: true,
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          fillColor: Colors.grey.withOpacity(0.2),
                          hintText: "Ndeme Yvan",
                          focusedBorder: OutlineInputBorder(
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
                        validator: validateName,
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
