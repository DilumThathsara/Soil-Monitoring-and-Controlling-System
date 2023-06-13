import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/controllers/auth_controller.dart';
import 'package:soil_app/providers/auth/user_provider.dart';
import 'package:soil_app/screens/main/drawer/drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu));
                    }),
                    const SizedBox(
                      width: 140,
                    ),
                    const CustomText('Profile'),
                  ],
                ),
                const SizedBox(
                  height: 122,
                ),
                InkWell(
                  onTap: () {
                    value.selectAndUploadProfileImage();
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2),
                        image: DecorationImage(
                            image: NetworkImage(
                              value.userModel!.img,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  value.userModel!.name,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  value.userModel!.email,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7085C3),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  value.userModel!.address,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff7085C3),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  value.userModel!.mobile,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    onTap: () {
                      AuthController.signOutUser();
                    },
                    text: "Logout")
              ],
            ),
          ),
          drawer: const CustomDrawer(),
        );
      },
    );
  }
}
