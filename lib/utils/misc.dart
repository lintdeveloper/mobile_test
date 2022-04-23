import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

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

// Widget showSnackbar(BuildContext context, { required String msg}) {
//   return Flushbar(
//     backgroundColor: const Color.fromRGBO(255, 69, 65, 1),
//     flushbarPosition: FlushbarPosition.TOP,
//     title: "Error",
//     message: msg,
//     duration: const Duration(seconds: 3),
//   ).show(context);
// }


