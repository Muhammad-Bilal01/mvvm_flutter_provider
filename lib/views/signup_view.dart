import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../resources/constant/strings_contant.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  // To change the obsecure style
  ValueNotifier<bool> isObsecure = ValueNotifier(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    isObsecure.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);

    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.signup),
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
                      label: const Text(AppString.password),
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
              title: AppString.signup,
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
                  authProvider.callSignupApi(context, data);
                }
              },
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              },
              child: const Text("Already have an account? login"),
            ),
          ],
        ),
      ),
    );
  }
}
