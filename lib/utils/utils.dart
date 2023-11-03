import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMsg(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
