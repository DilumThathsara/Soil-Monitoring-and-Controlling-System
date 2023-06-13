import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/providers/home/notificationAPI.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';

class SoilMoisture extends StatefulWidget {
  const SoilMoisture({super.key});

  @override
  State<SoilMoisture> createState() => _SoilMoistureState();
}

class _SoilMoistureState extends State<SoilMoisture> {
  String _Sval = "";
  // String? qrCode = ScanQrPage.deviceId;
  @override
  void initState() {
    getSMvalue();
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
              Image.asset('${AssetsConstant.imagepath}Moisture.png'),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    "Moisturizing Level",
                    fontSize: 16,
                    color: AppColors.black,
                    // fontWeight: FontWeight.normal,
                  ),
                  CustomText(
                    '$_Sval %',
                    fontSize: 18,
                    color: AppColors.black,
                    // fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
        //
      ],
    );
  }

  Future<void> getSMvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/soilM');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _Sval = data;
        Logger().i('Soil Moisturizing level is: $_Sval');
        if (int.parse(_Sval) < 10) {
          ShowNotification(
              id: 0,
              title: "Soil Moisturizing",
              body: "Soil water level is getting low");

          ShowNotification(
              id: 1,
              title: "Soil Moisturizing",
              body: "Turn on the Solenoid valve");
        }
      });
    });
  }
}
