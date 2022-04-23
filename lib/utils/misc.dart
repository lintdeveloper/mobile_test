import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:mobile_test/utils/utils.dart';

class ShowDialog {

  ShowDialog({required BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SpinKitFadingCircle(color: Colors.white);
        }
    );
  }
}

String getCurrency(String name) {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName,
      name: name);
  return format.currencySymbol;
}


AppBar buildAppBar(BuildContext context, {required String title}) {
  Size size =  MediaQuery.of(context).size;
  return AppBar(
    backgroundColor: AppColors.secondaryColor,
    toolbarHeight: size.height * 0.12,
    title: Container(
      margin: EdgeInsets.only(left: size.width * 0.06, top: size.height * 0.02),
      child: Text(title, style: AppTextStyle.textSize22.copyWith(
          color: AppColors.darkBlackColor.withOpacity(0.8), letterSpacing: 1
      )),
    ),
    automaticallyImplyLeading: false,
  );
}


