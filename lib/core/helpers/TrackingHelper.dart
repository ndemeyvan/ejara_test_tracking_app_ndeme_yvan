import 'package:flutter/cupertino.dart';
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
}
