import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/assets_constant.dart';

class SolenoidValve extends StatefulWidget {
  const SolenoidValve({super.key});

  @override
  State<SolenoidValve> createState() => _SolenoidValveState();
}

class _SolenoidValveState extends State<SolenoidValve> {
  String _waterpump = '';

  @override
  void initState() {
    getWaterPumpvalue();
    super.initState();
  }

  bool isCliked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isCliked = !isCliked;
              //_waterpump = isCliked:
              if (isCliked) {
                _waterpump = "1";
              } else {
                _waterpump = "0";
              }
              updateWaterPumpvalue();
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffF0F0F0)),
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const SizedBox(width: 60),
                Image.asset('${AssetsConstant.imagepath}valve.png'),
                const SizedBox(width: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_waterpump == '1')
                      const CustomText(
                        'Pump is On',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    if (_waterpump == '0')
                      const CustomText(
                        'Pump is Off',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_waterpump == '1')
                      const CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 10,
                      ),
                    const SizedBox(height: 10),
                    if (_waterpump == '0')
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 238, 130, 123),
                        radius: 10,
                      )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        // CustomText(
        //   '${_waterpump2} ',
        //   color: Color.fromARGB(255, 68, 68, 68),
        //   fontSize: 16,
        // )
      ],
    );
  }

  Future<void> getWaterPumpvalue() async {
    String data = "";
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('Devices/20220101/WaterPump/valve');
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value.toString();
      setState(() {
        _waterpump = data;
      });
    });
  }

  Future<void> updateWaterPumpvalue() async {
    String data = "";
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('Devices/20220101/WaterPump');
    await ref.update({
      "valve": int.parse(_waterpump),
    });
    Logger().i('Valve is  value $_waterpump');
  }
}
