import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:issue24/pages/chat.dart';
import 'package:issue24/pages/findtalents.dart';
import 'package:issue24/pages/home.dart';
import 'package:issue24/pages/login_page.dart';
import 'package:issue24/pages/support.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  int _selectedIndex = 0;
  void _navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    FindTalents(),
    Chat(),
    Support(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottonBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Talents'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent), label: 'Support'),
          ]),
      body: _pages[_selectedIndex],
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
                )));
  }
}
