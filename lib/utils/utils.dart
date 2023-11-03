import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
// to change focus feild

  static changeFocusFeild(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMsg(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushbarErrorMessage(BuildContext context, String message) {
    Flushbar(
      backgroundColor: Colors.red,
      message: message,
      icon: const Icon(Icons.error),
      duration: const Duration(seconds: 2),
    ).show(context);
  }
}
