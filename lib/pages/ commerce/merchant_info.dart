import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/merchant_single_row.dart';
import '../../core/components/tracking_button.dart';
import '../../core/helpers/TrackingHelper.dart';
import '../../core/routes/route_path.dart';
import '../../core/theme/theme.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({Key? key}) : super(key: key);

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController merchantNameController = TextEditingController();
  TextEditingController epargneController = TextEditingController();

  String? validateMerchantNanme(String? value) {
    var passNonNullValue = value ?? "";
    if (passNonNullValue.isEmpty) {
      return ("Le nom du marchant est requis");
    }
    return null;
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      closeKeyBoard();
      Navigator.pushNamed(context, transactionStatusScreen,
          arguments: {
            'description': "Test description",
            "isSuccess": false
          });
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
                          "Entrer les informations du commerçant",
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
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nom utilisateur
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0),
                            child: Text(
                              "Nom utilisateur épargnant",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp),
                            ),
                          ),
                          TextFormField(
                            controller: merchantNameController,
                            style: TextStyle(
                                color: BLACKCOLOR, fontWeight: FontWeight.w700),
                            decoration: InputDecoration(
                              isDense: true,
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              fillColor: Colors.grey.withOpacity(0.2),
                              hintText: "Entrez le nom du marchant",
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintStyle: TextStyle(
                                color: BLACKCOLOR,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            keyboardType: TextInputType.text,
                            validator: validateMerchantNanme,
                            obscureText: false,
                            onSaved: (String? val) {},
                          ),
                          SizedBox(height: 10.h,),
                          const Divider(
                            color: Colors.grey,
                            height: 1,
                          ),
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
                               padding:  EdgeInsets.only(left: 7.w),
                               child: Text(
                                 "CFA",
                                 style: TextStyle(
                                     color: BLACKCOLOR,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 18.sp),
                               ),
                             ),
                             Expanded(
                               child: TextFormField(
                                 style: TextStyle(
                                     color: BLACKCOLOR, fontWeight: FontWeight.w700),
                                 decoration: InputDecoration(
                                   isDense: true,
                                   focusedErrorBorder: OutlineInputBorder(
                                     borderSide: const BorderSide(
                                         width: 2, color: Colors.transparent),
                                     borderRadius: BorderRadius.circular(5.0),
                                   ),
                                   fillColor: Colors.grey.withOpacity(0.2),
                                   hintText: "Montant d'épargne",
                                   errorBorder: OutlineInputBorder(
                                     borderSide: const BorderSide(
                                         width: 2, color: Colors.transparent),
                                     borderRadius: BorderRadius.circular(5.0),
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderSide: const BorderSide(
                                         width: 2, color: Colors.transparent),
                                     borderRadius: BorderRadius.circular(5.0),
                                   ),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: const BorderSide(
                                         width: 2, color: Colors.transparent),
                                     borderRadius: BorderRadius.circular(5.0),
                                   ),
                                   border: OutlineInputBorder(
                                     borderSide: const BorderSide(
                                         width: 2, color: Colors.transparent),
                                     borderRadius: BorderRadius.circular(5.0),
                                   ),
                                   hintStyle: TextStyle(
                                     color: BLACKCOLOR,
                                     fontWeight: FontWeight.w500,
                                   ),
                                 ),
                                 keyboardType: TextInputType.number,
                                 validator: validateMerchantNanme,
                                 obscureText: false,
                                 onSaved: (String? val) {},
                               ),
                             ),
                           ],
                         ),
                          // Option epargne
                          MerchantSingleRow(
                            title: "Option d'épargne",
                            subTitle: 'OTA TCHAD 5%',
                            onPressed: () {
                              Navigator.pushNamed(context, savingOptionScreen);
                            },
                          ),
                          // Operateur DSA
                          MerchantSingleRow(
                            title: 'Operateur DSA',
                            subTitle: 'Orange',
                            onPressed: () {
                              Navigator.pushNamed(context, merchantOperator);
                            },
                          ),
                          // Numero de telephone DSA
                          MerchantSingleRow(
                            title: 'Numero de telephone DSA',
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
