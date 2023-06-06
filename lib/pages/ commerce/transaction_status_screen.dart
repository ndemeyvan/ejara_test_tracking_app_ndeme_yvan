import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/routes/route_path.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/theme.dart';

import '../../core/components/tracking_button.dart';
import '../../core/theme/style.dart';
import '../bloc/amplitude_bloc.dart';

class TransactionStatusScreen extends StatefulWidget {
  bool isSuccess;
  String description;
  TransactionStatusScreen(
      {Key? key, required this.description, required this.isSuccess})
      : super(key: key);

  @override
  State<TransactionStatusScreen> createState() =>
      _TransactionStatusScreenState();
}

class _TransactionStatusScreenState extends State<TransactionStatusScreen> {
  void _validateInputs() {
    BlocProvider.of<AmplitudeBloc>(context)
        .add(AmplitudeEmitterEvent(eventName: "click/btn_go_back_home"));
    /*
      * Normally I'd use a scroll listener to listen to the user's
      *  movements on the page, let's suppose that the value
      * is this one at the bottom
      * */
    Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false,
        arguments: {
          "previousPageHeight": screenHeight(context),
          "previousPageLoad": 100.0,
          "previousPageSeen": 100.0,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SuccessOrErrorComponent(
                  isSuccessComponent: widget.isSuccess,
                  description: widget.description),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w) +
                    EdgeInsets.only(bottom: 100.h),
                child: TrackingButton(
                  onPressed: _validateInputs,
                  title: "Retourner a la page d'acceuil",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SuccessOrErrorComponent(
      {required bool isSuccessComponent, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 115.h,
        ),
        isSuccessComponent
            ? Icon(
                Icons.check_circle_sharp,
                color: GREENCOLOR.withOpacity(0.8),
                size: 50.h,
              )
            : Icon(
                Icons.close_outlined,
                color: Colors.red,
                size: 50.h,
              ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          width: 310.w,
          child: Text(
            "$description",
            style: TextStyle(
                color: BLACKCOLOR,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp),
          ),
        )
      ],
    );
  }
}
