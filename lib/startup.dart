import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:issue24/pages/findtalents.dart';
import 'package:issue24/pages/poststartup.dart';

import 'pages/login_page.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup"),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FindTalents()));
                  },
                  child: Text(
                    'Find Talents',
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
                        MaterialPageRoute(builder: (context) => PostStartup()));
                  },
                  child: Text(
                    'Post your Startup',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
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
