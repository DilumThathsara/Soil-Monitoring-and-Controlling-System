import 'package:flutter/material.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/screens/auth/login.dart';
import 'package:soil_app/screens/auth/signup.dart';
import 'package:soil_app/utils/assets_constant.dart';
import 'package:soil_app/utils/util_functions.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Image.asset(
                  AssetsConstant.startPagepath,
                  width: 380,
                  height: 270,
                ),
                const SizedBox(height: 70),
                Column(
                  children: const [
                    CustomText(
                      'Soil Monitoring and Controlling',
                      fontSize: 28,
                    ),
                    CustomText(
                      'System',
                      fontSize: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 168),
                CustomButton(
                    onTap: () {
                      UtilFunctions.navigateTo(context, const Singup());
                    },
                    text: 'SignUp'),
                const SizedBox(height: 15),
                CustomButton(
                  onTap: () {
                    UtilFunctions.navigateTo(context, const Login());
                  },
                  text: 'LogIn',
                  color: const Color.fromARGB(221, 180, 180, 173),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
