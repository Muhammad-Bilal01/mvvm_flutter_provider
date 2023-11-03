import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
          onTap: () {
            Utils.flushbarErrorMessage(context, "No Internet Connection");
            //Utils.toastMsg("No Internet Connections");
          },
          child: Text("Show Message")),
    ));
  }
}
