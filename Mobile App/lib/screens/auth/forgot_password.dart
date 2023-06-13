import 'package:flutter/material.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/components/custom_textfield.dart';
import 'package:soil_app/utils/assets_constant.dart';
import 'package:soil_app/utils/util_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              UtilFunctions.goBAck(context);
            },
          ),
          backgroundColor: const Color(0xffF9F9F9),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Image.asset(
                  AssetsConstant.forgotPasspath,
                  width: 300,
                  height: 250,
                ),
                const SizedBox(height: 41),
                const CustomText('Forgot Password', fontSize: 25),
                const SizedBox(height: 10),
                const CustomText(
                  'Please, enter your email address. You will receive \na link to create a new password via email.',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                CustomTextfield(controller: _email, hintText: 'Email'),
                const SizedBox(height: 50),
                CustomButton(onTap: () {}, text: "Send"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
