import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:issue24/pages/findstartups.dart';
import 'package:issue24/pages/postservice.dart';
import 'package:issue24/pages/support.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'pages/login_page.dart';

class Talent extends StatefulWidget {
  const Talent({super.key});

  @override
  State<Talent> createState() => _TalentState();
}

class _TalentState extends State<Talent> {
  final videoURL = "https://www.youtube.com/watch?v=_u4_iWCvZ5c";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talents"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.deepPurple,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindStartups()));
                  },
                  child: Text(
                    'Find Startups',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
              ),
              SizedBox(width: 20),
              Container(
                width: 200,
                height: 200,
                color: Colors.deepPurple[300],
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostService()));
                  },
                  child: Text(
                    'Post a Service',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () => debugPrint('Ready'),
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Support(),
                  ));
            },
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.support_agent),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                height: 40,
                onPressed: (() {}),
                child: Text(
                  'Become a Talent',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
              ),
              SizedBox(width: 10),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                height: 40,
                onPressed: (() {}),
                child: Text(
                  'Become a Business',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
              ),
              SizedBox(width: 10),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                height: 40,
                onPressed: (() {}),
                child: Text(
                  'Post a Service',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
              ),
              SizedBox(width: 10),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 5,
                height: 40,
                onPressed: (() {}),
                child: Text(
                  'Post a Job',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.deepPurple,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          showRegisterPage: () {},
        ),
      ),
    );
  }
}
