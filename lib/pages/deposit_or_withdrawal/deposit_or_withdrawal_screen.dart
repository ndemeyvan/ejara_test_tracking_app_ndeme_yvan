import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/merchant_single_row.dart';
import '../../core/components/tracking_button.dart';
import '../../core/components/tracking_no_design_input.dart';
import '../../core/helpers/TrackingHelper.dart';
import '../../core/routes/route_path.dart';
import '../../core/theme/theme.dart';
import '../bloc/amplitude_bloc.dart';

class DepositOrWithdrawalScreen extends StatefulWidget {
  bool isDepositTransaction;
  String description;
  DepositOrWithdrawalScreen(
      {Key? key, required this.description, required this.isDepositTransaction})
      : super(key: key);

  @override
  State<DepositOrWithdrawalScreen> createState() => _DepositOrWithdrawalScreenState();
}

class _DepositOrWithdrawalScreenState extends State<DepositOrWithdrawalScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController depositAmountController = TextEditingController();

  String? validateDepositAmount(String? value) {
    var text = value ?? "";
    String message = "Le montant du dépot est requis";
    if (text.isEmpty) {
      BlocProvider.of<AmplitudeBloc>(context).add(AmplitudeEmitterEvent(
          eventName: "input/wrong_input",
          eventProperties: TrackingHelper.getErrorProperties(
              type: "input", message: message)));
      return message;
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<AmplitudeBloc>(context)
          .add(AmplitudeEmitterEvent(eventName: "click/btn_continue_deposit_or_withdrawal"));
      closeKeyBoard();
      Navigator.pushNamed(context, transactionStatusScreen,
          arguments: {'description': "Test description", "isSuccess": true});
    } else {
      closeKeyBoard();
    }
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
                            Icons.close,
                            color: Colors.grey,
                            size: 30.h,
                          )),
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          widget.isDepositTransaction
                              ? "Dépose de l’argent sur Ejara"
                              : "Retire de l’argent vers ton Mobile Money",
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
                Card(
                  elevation: 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Montant epargne
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0),
                            child: Text(
                              "Montant d'épargne",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 7.w),
                                child: Text(
                                  "CFA",
                                  style: TextStyle(
                                      color: BLACKCOLOR,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp),
                                ),
                              ),
                              Expanded(
                                child:  TrackingNoDesignInput(
                                  fieldController: null,
                                  validator: validateDepositAmount,
                                  obscurText: false,
                                  onChanged: (String? value) {},
                                  placeholder: "Montant du dépot",
                                ),

                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          // Numero de telephone DSA
                          MerchantSingleRow(
                            title: 'Numero de telephone',
                            subTitle: '237',
                            onPressed: () {
                              Navigator.pushNamed(context, dsaOptionScreen);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
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
