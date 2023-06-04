import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constant/constants.dart';
import 'core/routes/route_path.dart';
import 'core/routes/router.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
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
            initialRoute: homeScreen,
            onGenerateRoute: generateRoute,
          );
        });
  }
}

