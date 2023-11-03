import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/repository/auth_repo.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _myRepo = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

// call LoginApi
  Future<void> callLoginApi(BuildContext context, dynamic data) async {
    setIsLoading(true);
    await _myRepo.login(data).then((value) {
      setIsLoading(false);
      Utils.flushbarErrorMessage(context, "Login Successfull");
      if (kDebugMode) {
        print("Successful");
      }
    }).onError((error, stackTrace) {
      setIsLoading(false);
      Utils.flushbarErrorMessage(context, error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
