import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/constants.dart';
import '../../core/routes/route_path.dart';
import '../../core/theme/theme.dart';
import '../bloc/amplitude_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mes Paramètres",
                    style: TextStyle(
                        color: BLACKCOLOR,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_sharp,
                        color: Colors.grey,
                        size: 30.h,
                      )),
                ],
              ),
            ),
            SizedBox(height: 60.h),
            Card(
              child: Column(
                children: [
                  singleRowSettingItem(
                      onPress: () {
                        BlocProvider.of<AmplitudeBloc>(
                            context)
                            .add(AmplitudeEmitterEvent(
                            eventName:
                            "click/pin_code_option"));
                        // Go to Pin Code setting
                        Navigator.pushNamed(context, pinCodeScreen);
                      },
                      iconPath: CODE_PIN_ICON,
                      description: "Code Pin"),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  // This MOBILE_MONEY_SETTING_ICON is blue bz , it's not possible to keep it , with the same figma group
                  singleRowSettingItem(
                      onPress: () {
                        // Go to momo setting
                        BlocProvider.of<AmplitudeBloc>(
                            context)
                            .add(AmplitudeEmitterEvent(
                            eventName:
                            "click/add_number"));
                        Navigator.pushNamed(context, addNumberScreen);
                      },
                      iconPath: MOBILE_MONEY_SETTING_ICON,
                      description: "Numéro Mobile Money"),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  // This MOBILE_MONEY_SETTING_ICON is blue bz , it's not possible to keep it , with the same figma group
                  singleRowSettingItem(
                      onPress: () {
                        // Go to momo setting
                        BlocProvider.of<AmplitudeBloc>(
                            context)
                            .add(AmplitudeEmitterEvent(
                            eventName:
                            "click/contact_support_option"));
                        Navigator.pushNamed(context, contactSupportScreen);
                      },
                      iconPath: MOBILE_MONEY_SETTING_ICON,
                      description: "Contactez le support"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleRowSettingItem(
      {required VoidCallback onPress,
      required String iconPath,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 45.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: BLACKCOLOR,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey.withOpacity(0.7),
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
