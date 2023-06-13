import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/components/custom_textfield.dart';
import 'package:soil_app/providers/auth/signup_provider.dart';
import 'package:soil_app/screens/auth/login.dart';
import 'package:soil_app/utils/assets_constant.dart';
import 'package:soil_app/utils/util_functions.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<SignupProvider>(
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
                  const SizedBox(height: 25),
                  Image.asset(
                    AssetsConstant.signUppath,
                    width: 380,
                    height: 250,
                  ),
                  const SizedBox(height: 19),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: CustomText('Register Here')),
                  const SizedBox(height: 15),
                  CustomTextfield(
                      controller:
                          Provider.of<SignupProvider>(context).nameController,
                      hintText: 'Name'),
                  const SizedBox(height: 8),
                  CustomTextfield(
                      controller:
                          Provider.of<SignupProvider>(context).emailController,
                      hintText: 'Email'),
                  const SizedBox(height: 8),
                  CustomTextfield(
                      controller: Provider.of<SignupProvider>(context)
                          .addressController,
                      hintText: 'Address'),
                  const SizedBox(height: 8),
                  CustomTextfield(
                      controller: Provider.of<SignupProvider>(context)
                          .passwordController,
                      hintText: 'Password',
                      isObsecure: true),
                  const SizedBox(height: 8),
                  CustomTextfield(
                      controller:
                          Provider.of<SignupProvider>(context).mobileController,
                      hintText: 'Mobile number',
                      isObsecure: true),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        UtilFunctions.navigateTo(context, const Login());
                      },
                      child: const CustomText(
                        'Already have an account?',
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                      isLoading: value.isLoading,
                      onTap: () {
                        value.startSignup(context);
                      },
                      text: "SignUp"),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
