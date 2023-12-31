import 'package:flutter/material.dart';
import 'package:mvvm_flutter_provider/resources/constant/colors.dart';
import 'package:mvvm_flutter_provider/resources/constant/strings_contant.dart';

class RoundButton extends StatelessWidget {
  final Function()? onPress;
  final String title;
  final bool loading;
  const RoundButton({
    super.key,
    required this.onPress,
    required this.title,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.buttonColor,
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColor.whiteColorColor,
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.whiteColorColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
