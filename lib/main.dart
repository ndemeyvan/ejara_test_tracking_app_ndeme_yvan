import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constant/constants.dart';
import 'core/routes/route_path.dart';
import 'core/routes/router.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  // // Create the instance
  final Amplitude analytics = Amplitude.getInstance(instanceName: "project");

  // Initialize SDK
  analytics.init("a4d936d377ebafb201b7ae36694e3542");

  // Log an event
  analytics.logEvent('MyApp startup',
      eventProperties: {'friend_num': 10, 'is_heavy_user': true});
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            title: Constants.APP_NAME,
            // initialRoute: depositOrWithdrawalScreen,
            initialRoute: loginScreen,
            onGenerateRoute: generateRoute,
          );
        });
  }
}

