import 'package:flutter/material.dart';

class FindTalents extends StatefulWidget {
  const FindTalents({super.key});

  @override
  State<FindTalents> createState() => _FindTalentsState();
}

class _FindTalentsState extends State<FindTalents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Find Talents')),
    );
  }
}
