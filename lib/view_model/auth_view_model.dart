import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/repository/auth_repo.dart';
import 'package:mvvm_flutter_provider/utils/routes/routes_name.dart';
import 'package:mvvm_flutter_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final AuthRepository _myRepo = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isSignUpLoading = false;

  bool get isSignUpLoading => _isLoading;

  void setSignupLoading(bool value) {
    _isSignUpLoading = value;
    notifyListeners();
  }

// call LoginApi
  Future<void> callLoginApi(BuildContext context, dynamic data) async {
    setIsLoading(true);

    await _myRepo.login(data).then((value) {
      setIsLoading(false);

      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );

      Utils.flushbarErrorMessage(context, "Login Successfull");

      Navigator.pushNamed(context, RoutesName.homeSccreen);
      if (kDebugMode) {
        // print(userPreferences.getUser());
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

// call Register Api
  Future<void> callSignupApi(BuildContext context, dynamic data) async {
    setSignupLoading(true);

    await _myRepo.registerUser(data).then((value) {
      setSignupLoading(false);

      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );

      Utils.flushbarErrorMessage(context, "Signup Successfull");
      Navigator.pushNamed(context, RoutesName.homeSccreen);
      if (kDebugMode) {
        print("Successful");
      }
    }).onError((error, stackTrace) {
      setSignupLoading(false);

      Utils.flushbarErrorMessage(context, error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
