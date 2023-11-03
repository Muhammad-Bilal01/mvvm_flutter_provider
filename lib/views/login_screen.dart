import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/resources/constant/strings_contant.dart';
import 'package:mvvm_flutter_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  // To change the obsecure style
  ValueNotifier<bool> isObsecure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);

    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: _emailFocus,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text(AppString.email),
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utils.changeFocusFeild(context, _emailFocus, _passwordFocus);
              },
            ),
            ValueListenableBuilder(
                valueListenable: isObsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: _passwordFocus,
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: isObsecure.value,
                    decoration: InputDecoration(
                      label: const Text(AppString.Password),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          isObsecure.value = !isObsecure.value;
                        },
                        child: isObsecure.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: height * 0.070,
            ),
            RoundButton(
              title: AppString.login,
              loading: authProvider.isLoading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushbarErrorMessage(context, "please Enter Email");
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushbarErrorMessage(context, "Please Enter Password");
                } else if (_passwordController.text.length < 6) {
                  Utils.flushbarErrorMessage(
                      context, "Password must be 6 characters long");
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authProvider.callLoginApi(context, data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
