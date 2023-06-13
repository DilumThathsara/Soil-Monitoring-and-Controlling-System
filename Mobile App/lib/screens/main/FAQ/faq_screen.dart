import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/providers/home/questin_provider.dart';
import 'package:soil_app/screens/main/drawer/drawer.dart';

import '../../../utils/assets_constant.dart';

class FAQcreen extends StatefulWidget {
  const FAQcreen({super.key});

  @override
  State<FAQcreen> createState() => _FAQcreenState();
}

class _FAQcreenState extends State<FAQcreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Consumer<QuestionProvider>(
      builder: (context, value, child) {
        return Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.menu),
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    const CustomText("Frequently Asked \nQuestions :"),
                    const Spacer(),
                    Image.asset(AssetsConstant.bellPath)
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: value.faqList.length,
                    itemBuilder: (context, index) => Container(
                        width: size.width,
                        height: 170,
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width,
                              height: 64,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: const Color(0xffEEEEEE),
                                  borderRadius: BorderRadius.circular(17)),
                              child: CustomText(
                                '${index + 1}. ${value.faqList[index].question}',
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: size.width * 0.75,
                              height: 64,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 12,
                                        color:
                                            Color.fromARGB(255, 203, 203, 203))
                                  ],
                                  color:
                                      const Color.fromARGB(255, 249, 249, 249)),
                              child: CustomText(
                                value.faqList[index].answer,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          drawer: const CustomDrawer(),
        );
      },
    ));
  }
}
