import 'package:flutter/material.dart';

import '../helpers/TrackingHelper.dart';

/// Radius size 10.0
const double kRadius = 7.0;

/// Button height 55.0
const double kBtnHeight = 60.0;

// AppBar title Height
const double kAppBarFontSize = 22.0;

/// Horizontal Padding 16.0
const double kHorizontalPadding = 16.0;

class Constants {
  static String APP_NAME = 'Tracking App';

  static String API_KEY = 'a4d936d377ebafb201b7ae36694e3542';

  // Fonts
  static double pagePadding = 20.0;
  static double inputTextBorder = 5.0;
  static double titleFadeTime = 2.0;
  static double coverCardFadeTime = 3.0;
}

// Image
const EJARA_LOGO = "assets/images/ejara_logo.png";
const SETTING_ICON = "assets/images/setting_svg_icon.svg";
const STORE_ICON = "assets/images/store_icon.svg";
const TRANSACTION_ICON = "assets/images/transaction_icon.svg";
const SUCCESS_ICON = "assets/images/success_icon.svg";
const CODE_PIN_ICON = "assets/images/code_pin_icon.svg";
const MOBILE_MONEY_SETTING_ICON = "assets/images/mobile_money_setting_icon.svg";

//get mediaquery
Size getMediaQuery(BuildContext context){
  return MediaQuery.of(context).size;
}




const openContainerTransitionDuration = 700;