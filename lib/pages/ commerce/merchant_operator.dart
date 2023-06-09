import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/option_choice_item.dart';
import '../../core/components/tracking_button.dart';
import '../../core/theme/theme.dart';
import '../bloc/amplitude_bloc.dart';

class MerchantOperator extends StatefulWidget {
  const MerchantOperator({Key? key}) : super(key: key);

  @override
  State<MerchantOperator> createState() => _MerchantOperatorState();
}

class _MerchantOperatorState extends State<MerchantOperator> {
  bool isMomoChecked = false;
  bool isOMChecked = false;

  void _validateInputs() {
    BlocProvider.of<AmplitudeBloc>(context).add(
        AmplitudeEmitterEvent(eventName: "click/button_save_operator_selected"));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                            Icons.close_sharp,
                            color: Colors.grey,
                            size: 30.h,
                          )),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          "Choisir l’opérateur de Mobile Money",
                          style: TextStyle(
                              color: BLACKCOLOR,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
            Card(
              child:Column(
                children: [
                  OptionChoiceTitle(
                    onPressed: () {
                      setState(() {
                        isMomoChecked = !isMomoChecked;
                        isOMChecked = false;
                        BlocProvider.of<AmplitudeBloc>(context).add(
                            AmplitudeEmitterEvent(eventName: "click/check_box_button_momo"));
                      });
                    },
                    isChecked: isMomoChecked,
                    subTitle: 'MTN Mobile money',
                    showTitle: false,
                    title: '',
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  OptionChoiceTitle(
                    onPressed: () {
                      setState(() {
                        isMomoChecked = false;
                        isOMChecked = !isOMChecked;
                        BlocProvider.of<AmplitudeBloc>(context).add(
                            AmplitudeEmitterEvent(eventName: "click/check_box_button_orange_money"));
                      });
                    },
                    isChecked: isOMChecked,
                    subTitle: 'Orange',
                    showTitle: false,
                    title: '',
                  ),
                ],
              )
            ),

            SizedBox(
              height: 170.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w) +
                  EdgeInsets.only(bottom: 100.h),
              child: TrackingButton(
                onPressed: _validateInputs,
                title: "Continue",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
