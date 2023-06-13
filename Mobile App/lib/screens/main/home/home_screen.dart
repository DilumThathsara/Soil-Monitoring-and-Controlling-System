import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/providers/auth/user_provider.dart';
import 'package:soil_app/providers/home/notificationAPI.dart';
import 'package:soil_app/screens/main/drawer/drawer.dart';
import 'package:soil_app/screens/main/home/sub_screens/npk_values.dart';
import 'package:soil_app/screens/main/home/sub_screens/soil_moisture.dart';
import 'package:soil_app/screens/main/home/sub_screens/soil_temp.dart';
import 'package:soil_app/screens/main/home/sub_screens/solenoid_valve.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _ETemp = "";
  String _humi = "";
  // String? qrCode = ScanQrPage.deviceId;

  @override
  void initState() {
    getEHvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
              width: size.width,
              child: Consumer<UserProvider>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 30),
                          CustomText(
                            AppLocalizations.of(context)!.home,
                            color: AppColors.black,
                            fontSize: 20,
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                // UtilFunctions.navigateTo(
                                //     context, const ScanQrPage());
                              },
                              icon: const Icon(Icons.qr_code_scanner_rounded))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 22,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(value.userModel!.img),
                            ),
                          ),
                          const SizedBox(width: 18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                'Hi ${value.userModel!.name}',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                              CustomText(
                                AppLocalizations.of(context)!.wel,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: size.width,
                        height: 172,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const SizedBox(width: 15),
                            Image.asset('${AssetsConstant.imagepath}sun.png'),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  AppLocalizations.of(context)!.temp,
                                  fontSize: 16,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      '$_ETemp ',
                                      fontSize: 24,
                                      color: AppColors.white,
                                    ),
                                    Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/15/15752.png',
                                      scale: 18,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomText(
                                  AppLocalizations.of(context)!.humi,
                                  fontSize: 16,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      '$_humi ',
                                      fontSize: 24,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    // Image.network(
                                    //   'https://cdn-icons-png.flaticon.com/512/15/15752.png',
                                    //   scale: 18,
                                    //   color: Colors.white,
                                    // )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            TabBar(
                              indicator: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5,
                                      color: const Color.fromARGB(
                                          255, 137, 137, 137)),
                                  borderRadius: BorderRadius.circular(10)),
                              // indicatorPadding: const EdgeInsets.all(1),
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              indicatorPadding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              tabs: [
                                CustomTab(
                                  AppLocalizations.of(context)!.soil,
                                  AppLocalizations.of(context)!.temp,
                                ),
                                CustomTab(
                                  AppLocalizations.of(context)!.soil,
                                  AppLocalizations.of(context)!.mois,
                                ),
                                CustomTab(
                                  'NPK',
                                  AppLocalizations.of(context)!.values,
                                ),
                                CustomTab(
                                  AppLocalizations.of(context)!.solenoid,
                                  AppLocalizations.of(context)!.valve,
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            const Expanded(
                              child: TabBarView(children: [
                                SoilTemp(),
                                SoilMoisture(),
                                NPKValues(),
                                SolenoidValve(),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              )),
          drawer: const CustomDrawer(),
        ),
      ),
    );
  }

  Future<void> getEHvalue() async {
    String data = "";
    DatabaseReference starCountRef1 =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/ETemp');
    starCountRef1.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _ETemp = data;
        Logger().i('Environment Temperature is: $_ETemp');
        if (int.parse(_ETemp) > 35) {
          ShowNotification(
              id: 0,
              title: "Temperature",
              body: "Environment Temperature is High");
          ShowNotification(
              id: 1, title: "Temperature", body: "Turn on the Solenoid valve");

          // LoginScreen.twilioFlutter.sendSMS(
          //                             toNumber: LoginScreen.loggedcontat! ,
          //                             messageBody:"Environment Temperature is High\nTurn on the Solenoid valve");
        }
        if (int.parse(_ETemp) < 20) {
          ShowNotification(
              id: 0,
              title: "Temperature",
              body: "Environment Temperature is Low");
          ShowNotification(
              id: 1,
              title: "Temperature",
              body: "Please check enviroment temp until it normal");

          // LoginScreen.twilioFlutter.sendSMS(
          //                             toNumber: LoginScreen.loggedcontat! ,
          //                             messageBody:"Environment Temperature is High\nTurn on the Solenoid valve");
        }
      });
    });
    DatabaseReference starCountRef2 =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/humidity');
    starCountRef2.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _humi = data;
        Logger().i('Environment Humidity is: $_humi');
        if (int.parse(_humi) > 80) {
          ShowNotification(
              id: 2, title: "Humidity", body: "Environment Humidity is High");
        }
      });
    });
  }
}

//-------------Tab bar label

class CustomTab extends StatelessWidget {
  const CustomTab(
    this.primaryText,
    this.secondaryText, {
    super.key,
  });

  final String primaryText;
  final String secondaryText;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              primaryText,
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              secondaryText,
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
