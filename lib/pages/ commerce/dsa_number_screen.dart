import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/option_choice_item.dart';
import '../../core/components/tracking_button.dart';
import '../../core/theme/style.dart';
import '../../core/theme/theme.dart';
import '../bloc/amplitude_bloc.dart';

class DsaOptionScreen extends StatefulWidget {
  const DsaOptionScreen({Key? key}) : super(key: key);

  @override
  State<DsaOptionScreen> createState() => _DsaOptionScreenState();
}

class _DsaOptionScreenState extends State<DsaOptionScreen> {
  bool isNumberOneChecked = false;
  bool isNumberTwoChecked = false;
  bool isNumberThreeChecked = false;

  void _validateInputs() {
    BlocProvider.of<AmplitudeBloc>(context).add(
        AmplitudeEmitterEvent(eventName: "click/button_save_number"));
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
                        width: 200.w,
                        child: Text(
                          "Sélectionner un numéro Mobile Money",
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
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
            Card(
                child: Column(
              children: [
                OptionChoiceTitle(
                  onPressed: () {
                    BlocProvider.of<AmplitudeBloc>(context).add(
                        AmplitudeEmitterEvent(
                            eventName: "click/check_box_number"));
                    setState(() {
                      isNumberOneChecked = !isNumberOneChecked;
                      isNumberTwoChecked = false;
                      isNumberThreeChecked = false;
                    });
                  },
                  isChecked: isNumberOneChecked,
                  subTitle: '+223 656209008',
                  showTitle: true,
                  title: 'MTN',
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                OptionChoiceTitle(
                  onPressed: () {
                    BlocProvider.of<AmplitudeBloc>(context).add(
                        AmplitudeEmitterEvent(
                            eventName: "click/check_box_number"));
                    setState(() {
                      isNumberTwoChecked = !isNumberTwoChecked;
                      isNumberOneChecked = false;
                      isNumberThreeChecked = false;
                    });
                  },
                  isChecked: isNumberTwoChecked,
                  subTitle: '+223 656209011',
                  showTitle: true,
                  title: 'Orange money',
                ),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                OptionChoiceTitle(
                  onPressed: () {
                    BlocProvider.of<AmplitudeBloc>(context).add(
                        AmplitudeEmitterEvent(
                            eventName: "click/check_box_number"));
                    setState(() {
                      isNumberThreeChecked = !isNumberThreeChecked;
                      isNumberTwoChecked = false;
                      isNumberOneChecked = false;
                    });
                  },
                  isChecked: isNumberThreeChecked,
                  subTitle: '+223 656209010',
                  showTitle: true,
                  title: 'Move',
                ),
              ],
            )),
            SizedBox(
              height: 170.h,
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
      )),
    );
  }
}
