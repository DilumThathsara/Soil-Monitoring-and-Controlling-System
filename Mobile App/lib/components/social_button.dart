import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.onTap,
    required this.iconPath,
  }) : super(key: key);

  final Function() onTap;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Container(
        width: 140,
        height: 64,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white),
        child: Image.asset(iconPath, width: 20, height: 20),
      ),
    );
  }
}
