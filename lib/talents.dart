import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:issue24/pages/findstartups.dart';
import 'package:issue24/pages/postservice.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'pages/login_page.dart';

class Talent extends StatefulWidget {
  const Talent({super.key});

  @override
  State<Talent> createState() => _TalentState();
}

class _TalentState extends State<Talent> {
  final videoURL = "https://www.youtube.com/watch?v=XH6IT_tsSUI";
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
          )
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
