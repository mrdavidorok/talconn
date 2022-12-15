import 'package:flutter/material.dart';

class FindTalents extends StatefulWidget {
  const FindTalents({super.key});

  @override
  State<FindTalents> createState() => _FindTalentsState();
}

class _FindTalentsState extends State<FindTalents> {
  List<Map<String, dynamic>> _allUsers = [
    {'id': 1, 'name': 'David', "Skill": 'Marketing'},
    {'id': 2, 'name': 'Blessing', "Skill": 'Software Engineering'},
    {'id': 3, 'name': 'Loni', "Skill": 'Writing'},
    {'id': 4, 'name': 'Fabrice', "Skill": 'Software Engineering'},
    {'id': 5, 'name': 'Zhanara', "Skill": 'Law'},
    {'id': 6, 'name': 'Borel', "Skill": 'UiUx Design'},
  ];

  List<Map<String, dynamic>> _founderUsers = [];
  @override
  void initState() {
    _founderUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enterKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user['Skill'].toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _founderUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
                labelText: 'Search Startups', suffixIcon: Icon(Icons.search)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _founderUsers.length,
              itemBuilder: (context, index) => Card(
                key: ValueKey(_founderUsers[index]['id']),
                color: Colors.deepPurple,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Text(
                    _founderUsers[index]['id'].toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  title: Text(
                    _founderUsers[index]['name'],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('${_founderUsers[index]['Skill'].toString()}',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
