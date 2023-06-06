import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void closeKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

class TrackingHelper {
  static String formatAmount(double? number, {String? currencyIso}) {
    if (number == null) return "";
    NumberFormat formatter = NumberFormat.decimalPattern('vi_VN');

    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;

    return formatter.format(number);
  }

  static getErrorProperties({
    required String type,
    required String message,
  }) {
    return {
      "Type": type,
      "Message": message,
    };
  }

  static makeToast({required String message}){
    Fluttertoast.showToast(
        msg: "event send : $message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static getPageViewProperties({
    required double previousPageHeight,
    required double previousPageLoad,
    required double previousPageSeen,
  }) {
    return {
      "Previous Page height": previousPageHeight,
      "Previous Page load": previousPageLoad,
      "Previous Page seen": previousPageSeen,
    };
  }

  static getContactSupportProperties({
    required String status,
    required String errorMessage,
    required String type,
    required String message,
  }) {
    return {
      "status": status,
      "errorMessage": errorMessage,
      "type": type,
      "message": message,
    };
  }

  static getSetPaymentProperties({
    required String action,
    required String operator,
    required String previousOperator,
  }) {
    return {
      "Action": action,
      "Operator": operator,
      "Previous Operator": previousOperator,
    };
  }

  static getTransactionEventProperties({
    required double amountFiat,
    required String paymentMethod,
    required String status,
  }) {
    return {
      "Action Fiat": amountFiat,
      "Payment Method": paymentMethod,
      "Status": status,
    };
  }

  static getSavingEventProperties({
    required double interestRate,
    required int merchantUserId,
    required String merchantUserName,
    required String plan,
  }) {
    return {
      "Interest Rate": interestRate,
      "Merchant User ID": merchantUserId,
      "Plan": merchantUserName,
    };
  }




}
