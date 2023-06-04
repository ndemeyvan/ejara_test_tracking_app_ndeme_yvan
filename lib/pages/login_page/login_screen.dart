import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/routes/route_path.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';
import '../../core/components/tracking_button.dart';
import '../../core/helpers/TrackingHelper.dart';
import '../../core/theme/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Variables
  String? _userName = "";
  String? _passWord = "";

  // Methods
  @override
  void initState() {
    super.initState();
  }

  String? validateUserName(String? value) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("User name is required");
    }
    return null;
  }

  String? validatePassword(String? value) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Password is required");
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
    } else {
      closeKeyBoard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "C’est parti!",
                      style: titleText(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 210.w,
                      child: Text(
                        "Accédez à l’application agent en deux clics",
                        style: TextStyle(
                          color: BLACKCOLOR,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    //User name
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0) +
                            EdgeInsets.only(left: 13.w),
                        // fillColor: Colors.grey.withOpacity(0.2),
                        // filled: true,
                        hintText: "User name",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.8)),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: validateUserName,
                      onSaved: (String? val) {
                        _userName = val;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //  Password
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0) +
                            EdgeInsets.only(left: 13.w),
                        fillColor: Colors.grey.withOpacity(0.2),
                        // filled: true,
                        hintText: "Mot de passe",
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      validator: validatePassword,
                      obscureText: true,
                      onSaved: (String? val) {
                        _passWord = val;
                      },
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  TrackingButton(
                    onPressed: _validateInputs,
                    title: "Connexion",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  TextButton(
                      onPressed: () {
                        // Go to Pin code page
                        // Navigator.pushNamed(context, transactionStatusScreen,
                        //     arguments: {
                        //       'description': "Test description",
                        //       "isSuccess": false
                        //     });

                        // Navigator.pushNamed(context, depositOrWithdrawalScreen,
                        //     arguments: {
                        //       'description': "Test description",
                        //       "isDepositTransaction": false
                        //     });
                        // Navigator.pushNamed(context, pinCodeScreen);
                      },
                      child: Text(
                        "Code pin page?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
