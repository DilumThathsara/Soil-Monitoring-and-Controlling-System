import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.color = AppColors.primaryColor,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final bool isLoading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 259,
        height: 50,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: isLoading
            ? const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              )
            : CustomText(
                text,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }
}
