import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/data/network/base_api_services.dart';
import 'package:mvvm_flutter_provider/data/network/network_api_services.dart';
import 'package:mvvm_flutter_provider/resources/constant/auth_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  // Login User API
  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginAPiEndPoint, data);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  // Register User API
  Future<dynamic> registerUser(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(
          AppUrl.registerAPiEndPoint, data);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
