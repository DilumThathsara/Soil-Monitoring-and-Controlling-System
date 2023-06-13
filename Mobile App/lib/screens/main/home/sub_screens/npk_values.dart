import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/providers/home/notificationAPI.dart';
import 'package:soil_app/screens/main/home/twilio.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';

class NPKValues extends StatefulWidget {
  const NPKValues({super.key});

  @override
  State<NPKValues> createState() => _NPKValuesState();
}

class _NPKValuesState extends State<NPKValues> {
  String _n = "";
  String _p = "";
  String _k = "";
  // String? qrCode = ScanQrPage.deviceId;

  @override
  void initState() {
    super.initState();
    getKvalue();
    getNvalue();
    getPvalue();
    // chkKvalue( );
    // chkNvalue();
    // chkPvalue();
    // chkAllvalue();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffF0F0F0)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.asset('${AssetsConstant.imagepath}npk.png'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainer('Nitrogen', '$_n '),
                    CustomContainer('Prosperous', '$_p '),
                    CustomContainer('Potassium', '$_k '),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getKvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/NPK/K');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _k = data;
        Logger().i('Potassium value is: $_k');
        if (int.parse(_k) > 30) {
          ShowNotification(
              id: 2,
              title: "NPK Values",
              body: "Potassium values are getting low");

          ShowNotification(
              id: 5,
              title: "Nearest Shop to buy",
              body: "Seed & Plant Retail Shop");
          Twilio.twilioFlutter.sendSMS(
              toNumber: '+94777200663',
              messageBody:
                  "Nitrogen values are getting low.\nYou can visit nearest shop to buy\nSeed & Plant Retail Shop\nWebsite - https://doa.gov.lk/ \nDirections - https://www.google.com/maps/dir//agriculture+shop+near+colombo/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x3ae2596eccf06917:0x7a94b1cab4b048a?sa=X&ved=2ahUKEwj__NPshLD4AhXqT2wGHc42BbEQ9Rd6BAgDEAQ");
        }
        // chkKvalue();
        //onClickedNotification(payload);
      });
    });
  }

  Future<void> getNvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/NPK/N');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _n = data;
        Logger().i('Nitrogen value is: $_n');
        if (int.parse(_n) < 30) {
          ShowNotification(
              id: 2,
              title: "NPK Values",
              body: "Nitrogen values are getting low");

          ShowNotification(
              id: 5,
              title: "Nearest Shop to buy",
              body: "Seed & Plant Retail Shop");
        }
        //chkNvalue();
      });
    });
  }

  Future<void> getPvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/SensorValue/NPK/P');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _p = data;
        Logger().i('Prosperous value is: $_p');
        //chkPvalue();
        if (int.parse(_p) > 30) {
          ShowNotification(
              id: 2,
              title: "NPK Values",
              body: "Prosperous values are getting low");

          ShowNotification(
              id: 5,
              title: "Nearest Shop to buy",
              body: "Seed & Plant Retail Shop");
        }
      });
    });
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
    this.textOne,
    this.textTwo, {
    super.key,
  });

  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                offset: Offset(0, 2),
                color: Color.fromARGB(255, 125, 125, 125))
          ],
          color: AppColors.white),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomText(
          textOne,
          color: AppColors.black,
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        CustomText(
          textTwo,
          color: AppColors.black,
          fontSize: 14,
        )
      ]),
    );
  }
}
