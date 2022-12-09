import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
          ],
        ),
      ),
    );
  }
}
