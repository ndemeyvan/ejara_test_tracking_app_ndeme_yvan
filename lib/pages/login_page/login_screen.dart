import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/routes/route_path.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';
import '../../core/components/tracking_button.dart';
import '../../core/components/tracking_loginInput.dart';
import '../../core/helpers/TrackingHelper.dart';
import '../../core/theme/style.dart';
import '../bloc/amplitude_bloc.dart';

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
    var text = value ?? "";
    if (text.isEmpty) {
      String errorMessage = "Le nom utilisateur est requis ";
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "input/wrong_input",
          eventProperties: TrackingHelper.getErrorProperties(
              type: "input", message: errorMessage)));
      return errorMessage;
    }
    return null;
  }

  String? validatePassword(String? value) {
    var text = value ?? "";
    if (text.isEmpty) {
      String errorMessage = "Le mot de passe est requis";
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "input/wrong_input",
          eventProperties: TrackingHelper.getErrorProperties(
              type: "input", message: errorMessage)));
      return errorMessage;
    }
    return null;
  }

  void _validateInputs({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
      BlocProvider.of<AmplitudeBloc>(context)
          .add(AmplitudeEmitterEvent(eventName: "click/connexion_button"));
      /*
      * Normally I'd use a scroll listener to listen to the user's
      *  movements on the page, let's suppose that the value
      * is this one at the bottom
      * */
      Navigator.pushNamed(context, homeScreen, arguments: {
        "previousPageHeight": screenHeight(context),
        "previousPageLoad": 100.0,
        "previousPageSeen": 100.0,
      });
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
                    TrackingLoginScreenInput(
                      obscurText: false,
                      fieldController: null,
                      validator: validateUserName,
                      onChanged: (String? value) {},
                      placeholder: "User name",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //  Password
                    TrackingLoginScreenInput(
                      obscurText: true,
                      fieldController: null,
                      textInput: TextInputType.visiblePassword,
                      validator: validatePassword,
                      onChanged: (String? value) {},
                      placeholder: "Mot de passe",
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
                    onPressed: () {
                      _validateInputs(context: context);
                    },
                    title: "Connexion",
                  ),
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
