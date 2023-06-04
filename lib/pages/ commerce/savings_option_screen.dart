import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/components/option_choice_item.dart';
import '../../core/components/tracking_button.dart';
import '../../core/theme/style.dart';
import '../../core/theme/theme.dart';

class SavingOptionScreen extends StatefulWidget {
  const SavingOptionScreen({Key? key}) : super(key: key);

  @override
  State<SavingOptionScreen> createState() => _SavingOptionScreenState();
}

class _SavingOptionScreenState extends State<SavingOptionScreen> {
  bool isOTFPlanChecked = false;

  void _validateInputs() {
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
                        width: 150.w,
                        child: Text(
                          "Choisir le plan d’épargne",
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
              child:Column(
                children: [
                  OptionChoiceTitle(
                    onPressed: () {
                      setState(() {
                        isOTFPlanChecked = !isOTFPlanChecked;
                      });
                    },
                    isChecked: isOTFPlanChecked,
                    subTitle: 'OTA TCHAD 5%',
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
                title: "Back",
              ),
            ),
          ],
        ),
      )),
    );
  }
}
