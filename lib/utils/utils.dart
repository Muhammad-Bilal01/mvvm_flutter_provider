import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMsg(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushbarErrorMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      icon: const Icon(Icons.error),
    ).show(context);
  }
}
