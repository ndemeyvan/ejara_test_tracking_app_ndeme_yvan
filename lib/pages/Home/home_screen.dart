import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ndeme_yvan_tracking_plan/core/routes/route_path.dart';
import 'package:ndeme_yvan_tracking_plan/core/theme/style.dart';
import '../../core/animation/fade_animation.dart';
import '../../core/components/chips_button.dart';
import '../../core/components/transaction_component.dart';
import '../../core/constant/constants.dart';
import '../../core/helpers/TrackingHelper.dart';
import '../../core/theme/theme.dart';
import '../bloc/amplitude_bloc.dart';

class HomeScreen extends StatefulWidget {
  double previousPageHeight;
  double previousPageLoad;
  double previousPageSeen;
  HomeScreen(
      {Key? key,
      required this.previousPageHeight,
      required this.previousPageLoad,
      required this.previousPageSeen})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> dummyList = [1, 2, 3, 4, 5, 5, 6];
  // List<int> dummyList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
        eventName: "time/page_display",
        eventProperties: TrackingHelper.getPageViewProperties(
            previousPageHeight: widget.previousPageHeight,
            previousPageLoad: widget.previousPageLoad,
            previousPageSeen: widget.previousPageSeen)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    width: screenWidth(context),
                    padding: const EdgeInsets.all(15) +
                        const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset(SETTING_ICON),
                          onTap: () {
                            BlocProvider.of<AmplitudeBloc>(context).add(
                                AmplitudeEmitterEvent(
                                    eventName: "click/setting_button"));
                            Navigator.pushNamed(context, settingScreen);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Balance Float",
                              style: TextStyle(
                                  color: BLACKCOLOR,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19.sp),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Icon(
                              Icons.visibility_off,
                              color: GREENCOLOR.withOpacity(0.6),
                              size: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        //  Amount
                        Center(
                          child: RichText(
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            maxLines: 3,
                            textScaleFactor: 1,
                            text: TextSpan(
                              text: "${TrackingHelper.formatAmount(500000)}",
                              style: TextStyle(
                                  color: BLACKCOLOR,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.sp),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'F',
                                    style: TextStyle(
                                        color: BLACKCOLOR,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.sp)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        // Button
                        Row(
                          children: [
                            Expanded(
                              child: ChipsButton(
                                text: 'Dépôt',
                                onPressed: () {
                                  BlocProvider.of<AmplitudeBloc>(context).add(
                                      AmplitudeEmitterEvent(
                                          eventName: "click/deposit_button"));
                                  Navigator.pushNamed(
                                      context, depositOrWithdrawalScreen,
                                      arguments: {
                                        'description': "Test description",
                                        "isDepositTransaction": true,
                                      });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: ChipsButton(
                                text: 'Retrait',
                                onPressed: () {
                                  BlocProvider.of<AmplitudeBloc>(context).add(
                                      AmplitudeEmitterEvent(
                                          eventName: "Float Withdrawal"));
                                  Navigator.pushNamed(
                                      context, depositOrWithdrawalScreen,
                                      arguments: {
                                        'description': "Test description",
                                        "isDepositTransaction": false,
                                      });
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
                //  Collecte Journaliere
                SizedBox(
                  height: 20.h,
                ),
                FadeAnimation(
                  0.4,
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: screenWidth(context),
                      padding: const EdgeInsets.all(15) +
                          const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            STORE_ICON,
                            height: 40.h,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<AmplitudeBloc>(context).add(
                                    AmplitudeEmitterEvent(
                                        eventName: "Float Withdrawal",
                                        eventProperties: TrackingHelper
                                            .getSavingEventProperties(
                                                interestRate: 10,
                                                merchantUserId: 02,
                                                merchantUserName:
                                                    "Test Merchant user name",
                                                plan: "OTA Tchad")));
                                BlocProvider.of<AmplitudeBloc>(context).add(
                                    AmplitudeEmitterEvent(
                                        eventName:
                                            "click/collection_component"));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Collecte journalière",
                                    style: TextStyle(
                                        color: BLACKCOLOR,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 19.sp),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Collecte de l’argent auprès des commerçants chaque jour ",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimation(
                  0.4,
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: screenWidth(context),
                      padding: const EdgeInsets.all(15) +
                          const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                TRANSACTION_ICON,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Transactions",
                                style: TextStyle(
                                    color: BLACKCOLOR,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          dummyList.isEmpty
                              ? emptyListComponent()
                              : Column(
                                  children: [
                                    for (var item in dummyList)
                                      TrackingItemComponent(
                                        onPressed: () {
                                          BlocProvider.of<AmplitudeBloc>(
                                                  context)
                                              .add(AmplitudeEmitterEvent(
                                                  eventName:
                                                      "click/select_transaction"));
                                        },
                                        title:
                                            'Cash-in OTA Tchad vers tiernotest',
                                        amount: 100000,
                                        date: '6 Avril 2023 a 07:43',
                                      ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyListComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Icon(
          Icons.add_circle,
          color: Colors.grey.withOpacity(0.5),
          size: 50,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 220.w,
          child: Text(
            "Vous n’avez pas encore de transaction",
            style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
