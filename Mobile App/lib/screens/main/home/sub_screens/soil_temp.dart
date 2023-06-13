import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/providers/home/notificationAPI.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';

class SoilTemp extends StatefulWidget {
  const SoilTemp({super.key});

  @override
  State<SoilTemp> createState() => _SoilTempState();
}

class _SoilTempState extends State<SoilTemp> {
  String _temp = "";
  // String? qrCode = ScanQrPage.deviceId;
  @override
  void initState() {
    gettempvalue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF0F0F0)),
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Image.asset('${AssetsConstant.imagepath}Temperature.png'),
              const SizedBox(width: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    '$_temp ',
                    color: AppColors.black,
                  ),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/15/15752.png',
                    scale: 18,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> gettempvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/soilTemp');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _temp = data;
        Logger().i('Soil Temp is: $_temp');
        if (int.parse(_temp) > 15) {
          ShowNotification(
              id: 3,
              title: "Soil Temperature",
              body: "Soil Temperature is High");
          ShowNotification(
              id: 4,
              title: "Soil Temperature",
              body: "Turn on the Solenoid valve");

          //     LoginScreen.twilioFlutter.sendSMS(
          // toNumber: LoginScreen.loggedcontat!,
          // messageBody: "Soil Temperature is High\nTurn on the Solenoid valve");
        }
      });
    });
  }
}
