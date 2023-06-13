import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_button.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/components/language_picker.dart';
import 'package:soil_app/controllers/auth_controller.dart';
import 'package:soil_app/providers/auth/user_provider.dart';
import 'package:soil_app/screens/main/FAQ/faq_screen.dart';
import 'package:soil_app/screens/main/Q&A/qa_screen.dart';
import 'package:soil_app/screens/main/home/home_screen.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';
import 'package:soil_app/utils/util_functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 20,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    Provider.of<UserProvider>(context, listen: false)
                        .userModel!
                        .img),
                radius: 34,
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("${AssetsConstant.imagepath}farm.jpg"),
                  fit: BoxFit.fill),
            ),
            accountName: const CustomText(
              'user',
              fontSize: 12,
              color: AppColors.white,
            ),
            accountEmail: const CustomText(
              'user@gmail.com',
              fontSize: 12,
              color: AppColors.white,
            ),
          ),
          drawerContainer(context, AppLocalizations.of(context)!.home,
              imgPath: AssetsConstant.homePath, widget: const HomeScreen()),
          drawerContainer(context, AppLocalizations.of(context)!.qa,
              imgPath: AssetsConstant.qaPath, widget: const QandAScreen()),
          drawerContainer(context, AppLocalizations.of(context)!.faq,
              imgPath: AssetsConstant.faqPath, widget: const FAQcreen()),
          const Divider(
            color: AppColors.black,
            endIndent: 20,
            indent: 20,
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: LanguagePickerWidget(),
          ),
          const SizedBox(height: 300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
                onTap: () {
                  AuthController.signOutUser();
                },
                text: AppLocalizations.of(context)!.logout),
          )
        ],
      ),
    );
  }

  //-------------custom container for drawer list
  InkWell drawerContainer(
    BuildContext context,
    String text, {
    required String imgPath,
    required Widget widget,
  }) {
    return InkWell(
      onTap: () {
        UtilFunctions.navigateTo(context, widget);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 3),

        // color: Colors.amber,
        child: Row(
          children: [
            Image.asset(
              imgPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 20),
            CustomText(
              text,
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
            const SizedBox(width: 90),
          ],
        ),
      ),
    );
  }
}
