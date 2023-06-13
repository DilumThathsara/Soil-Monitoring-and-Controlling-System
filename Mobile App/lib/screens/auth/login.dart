import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/components/custom_textfield.dart';
import 'package:soil_app/components/social_button.dart';
import 'package:soil_app/providers/auth/login_provider.dart';
import 'package:soil_app/screens/auth/forgot_password.dart';
import 'package:soil_app/utils/assets_constant.dart';
import 'package:soil_app/utils/util_functions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<LoginProvider>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const CustomText('Login to \na farming \nlife.'),
                              Image.asset(AssetsConstant.Wheelbarrowpath),
                            ],
                          ),
                          Image.asset(
                            AssetsConstant.Characterpath,
                            height: 300,
                          ),
                        ]),
                    const SizedBox(height: 40),
                    CustomTextfield(
                      controller:
                          Provider.of<LoginProvider>(context).emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 8),
                    CustomTextfield(
                      controller: Provider.of<LoginProvider>(context)
                          .passwordController,
                      hintText: 'Password',
                      isObsecure: true,
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          UtilFunctions.navigateTo(
                              context, const ForgotPassword());
                        },
                        child: const CustomText(
                          'Forgot your password?',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 29),
                    CustomButton(
                        onTap: () {
                          value.startSignin(context);
                        },
                        text: "Login"),
                    const SizedBox(height: 23),
                    const CustomText(
                      'Or login with social account',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButton(
                            onTap: () {},
                            iconPath: AssetsConstant.googlelogopath),
                        const SizedBox(width: 16),
                        SocialButton(
                            onTap: () {},
                            iconPath: AssetsConstant.facebooklogopath),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
