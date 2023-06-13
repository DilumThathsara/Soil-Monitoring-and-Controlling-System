import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soil_app/components/custom_text.dart';
import 'package:soil_app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class BBCNews extends StatefulWidget {
  const BBCNews({super.key});

  @override
  _BBCNewsState createState() => _BBCNewsState();
}

class _BBCNewsState extends State<BBCNews> {
  //initializing http package
  var client = http.Client();

  Future myDevBlog() async {
    //Making a http get request from my hashnode blog
    var response = await client
        .get(Uri.parse('https://www.usda.gov/rss/latest-releases.xml'));
    var channel = RssFeed.parse(response.body);
    final item = channel.items;
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.primaryColor,
      //   //title: const Text('VoiceNews'),
      //   title: Image.asset(
      //     AssetsConstant.iconPath,
      //     width: 150,
      //   ),
      //   elevation: 10.0,
      //   actions: [
      //     IconButton(
      //         onPressed: () {}, icon: const Icon(Icons.play_arrow_rounded))
      //   ],
      // ),
      body: StreamBuilder(
        stream: myDevBlog().asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    _launchURL(snapshot, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(width: 1),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              color: AppColors.black),
                        ]),
                    child: Column(
                      children: [
                        CustomText(
                          snapshot.data[index].title,
                          textAlign: TextAlign.left,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.alarm, size: 15),
                            const SizedBox(width: 10),
                            CustomText(snapshot.data[index].pubDate.toString(),
                                color: const Color.fromARGB(255, 158, 158, 158),
                                fontSize: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<void> _launchURL(AsyncSnapshot<dynamic> snapshot, int index) async {
    final Uri uri = Uri.parse('${snapshot.data[index].link}');
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }
}
