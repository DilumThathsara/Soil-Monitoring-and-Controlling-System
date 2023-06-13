import 'package:flutter/material.dart';

class CustomTextfieldQuestion extends StatelessWidget {
  const CustomTextfieldQuestion({
    required this.controller,
    required this.hintText,
    this.isObsecure = false,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 224, 223, 223),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
