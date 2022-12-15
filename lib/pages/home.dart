import 'package:flutter/material.dart';
import 'package:issue24/pages/support.dart';
import 'package:url_launcher/url_launcher.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image(image: AssetImage('asset/talents.gif')),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 20),
                    children: [
                      TextSpan(
                        text: 'eelspace ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      TextSpan(
                          text:
                              'is a technology startup, building solutions in the area of prototyping, mvp development, marketing, designs, operations and sales for small and midsize businesses',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'asset/facebook.png',
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'asset/instagram.png',
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'asset/twitter.png',
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'asset/linkedin.png',
                      )),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Download our Virtual Assistant - Anna',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 120,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _launchURL(
                              "https://play.google.com/store/apps/details?id=com.Slack&hl=en&gl=US");
                        },

                        child: Image(image: AssetImage('asset/googleplay.png')),
                        // child: const Text("Launch URL"),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 50,
                    width: 120,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _launchURL(
                              "https://apps.apple.com/ru/app/slack/id618783545");
                        },
                        child: Image(image: AssetImage('asset/appstore.png')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
