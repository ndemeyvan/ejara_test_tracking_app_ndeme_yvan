import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndeme_yvan_tracking_plan/core/routes/route_path.dart';
import 'package:ndeme_yvan_tracking_plan/pages/pin%20page/pin_screen.dart';
import '../../pages/ commerce/dsa_number_screen.dart';
import '../../pages/ commerce/merchant_operator.dart';
import '../../pages/ commerce/merchant_info.dart';
import '../../pages/ commerce/savings_option_screen.dart';
import '../../pages/ commerce/transaction_status_screen.dart';
import '../../pages/Home/home_screen.dart';
import '../../pages/contact_support/contact_support.dart';
import '../../pages/deposit_or_withdrawal/deposit_or_withdrawal_screen.dart';
import '../../pages/login_page/login_screen.dart';
import '../../pages/settings/confirmation_code/confirmation_code_screen.dart';
import '../../pages/settings/mobile_money_setting/add_number_screen.dart';
import '../../pages/settings/setting_screen.dart';
import '../../pages/undefined_page/undefined_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  String? routeName = settings.name;
  Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
  switch (routeName) {
    case homeScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => HomeScreen(
                previousPageHeight: args!['previousPageHeight'],
                previousPageLoad: args!['previousPageLoad'],
                previousPageSeen: args!['previousPageSeen'],
              ));
    case confirmationCodeScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => const ConfirmationCodeScreen());
    case addNumberScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const AddNumberScreen());
    case settingScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const SettingScreen());
    case depositOrWithdrawalScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => DepositOrWithdrawalScreen(
                description: args!['description'],
                isDepositTransaction: args!['isDepositTransaction'],
              ));
    case transactionStatusScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => TransactionStatusScreen(
                description: args!['description'],
                isSuccess: args!['isSuccess'],
              ));
    case dsaOptionScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const DsaOptionScreen());
    case savingOptionScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => const SavingOptionScreen());
    case merchantOperator:
      return MaterialPageRoute<Widget>(
          builder: (_) => const MerchantOperator());
    case merchantScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const MerchantScreen());
    case loginScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const LoginScreen());
    case contactSupportScreen:
      return MaterialPageRoute<Widget>(
          builder: (_) => const ContactSupportScreen());
    case pinCodeScreen:
      return MaterialPageRoute<Widget>(builder: (_) => const PinCodeScreen());
    default:
      return MaterialPageRoute(builder: (_) => const UndefinedPage());
  }
}
