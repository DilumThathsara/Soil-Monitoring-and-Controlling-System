import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/components/custom_textfield%20copy.dart';
import 'package:soil_app/providers/home/questin_provider.dart';
import 'package:soil_app/screens/main/drawer/drawer.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:soil_app/utils/util_functions.dart';

import '../../../utils/assets_constant.dart';

class QandAScreen extends StatefulWidget {
  const QandAScreen({super.key});

  @override
  State<QandAScreen> createState() => _QandAScreenState();
}

class _QandAScreenState extends State<QandAScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<QuestionProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //title: const Text('VoiceNews'),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: const CustomText("Q & A"),
            elevation: 0,
            actions: [Image.asset(AssetsConstant.bellPath)],
          ),
          body: ListView.separated(
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    width: size.width,
                    height: size.height / 2.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primaryColor),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: size.width,
                          height: 165,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                'Overview',
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                              SizedBox(
                                height: 100,
                                child: SingleChildScrollView(
                                  child: CustomText(
                                    value.qaList[index].question == ''
                                        ? " "
                                        : value.qaList[index].question,
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        255, 128, 126, 126),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     CustomText(
                              //       value.qaList[index].dateTime
                              //           .substring(0, 10),
                              //       color: const Color.fromARGB(
                              //           255, 168, 168, 168),
                              //       fontSize: 11,
                              //     ),
                              //     const SizedBox(width: 20),
                              //     CustomText(
                              //       value.qaList[index].dateTime
                              //           .substring(11, 16),
                              //       color: const Color.fromARGB(
                              //           255, 168, 168, 168),
                              //       fontSize: 11,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(right: 100, left: 10),
                          width: size.width,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                'Related answer',
                                color: AppColors.black,
                                fontSize: 17,
                              ),
                              SizedBox(
                                height: 90,
                                child: SingleChildScrollView(
                                  child: CustomText(
                                    value.qaList[index].answer == ''
                                        ? " "
                                        : value.qaList[index].answer,
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                        255, 128, 126, 126),
                                  ),
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     CustomText(
                              //       value.qaList[index].dateTime
                              //           .substring(0, 10),
                              //       color: const Color.fromARGB(
                              //           255, 168, 168, 168),
                              //       fontSize: 11,
                              //     ),
                              //     const SizedBox(width: 20),
                              //     CustomText(
                              //       value.qaList[index].dateTime
                              //           .substring(11, 16),
                              //       color: const Color.fromARGB(
                              //           255, 168, 168, 168),
                              //       fontSize: 11,
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: value.qaList.length),
          drawer: const CustomDrawer(),
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: () {
                openDialog();
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                  CustomText(
                    'Add Question',
                    fontSize: 12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  )
                ],
              )),
        );
      },
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const CustomText(
            "Add a question",
            color: AppColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          content: SizedBox(
            width: 500,
            height: 260,
            child: Column(
              children: [
                CustomTextfieldQuestion(
                  controller:
                      Provider.of<QuestionProvider>(context, listen: false)
                          .question,
                  hintText: 'Enter the question what you have',
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        UtilFunctions.goBAck(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 87, 85, 85))),
                        width: 90,
                        height: 40,
                        child: const Center(
                          child: CustomText(
                            'Cancel',
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        Provider.of<QuestionProvider>(context, listen: false)
                            .startaddQuestion(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 90,
                        height: 40,
                        child: const Center(
                          child: CustomText(
                            'Submit',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
