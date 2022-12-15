import 'package:flutter/material.dart';

class FindStartups extends StatefulWidget {
  const FindStartups({super.key});

  @override
  State<FindStartups> createState() => _FindStartupsState();
}

class _FindStartupsState extends State<FindStartups> {
  List<Map<String, dynamic>> _allUsers = [
    {'id': 1, 'name': 'Assisteva', "Industry": 'Education'},
    {'id': 2, 'name': 'Hemosave', "Industry": 'Health'},
    {'id': 3, 'name': 'FanIsFun', "Industry": 'Sport'},
    {'id': 4, 'name': 'Perk of Points', "Industry": 'Technology'},
    {'id': 5, 'name': 'RiseHall', "Industry": 'Education'},
    {'id': 6, 'name': 'SafeHouse', "Industry": 'Logistics'},
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
          .where((user) => user['Industry']
              .toLowerCase()
              .contains(enterKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _founderUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Startups'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    labelText: 'Search Startups',
                    suffixIcon: Icon(Icons.search)),
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
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      title: Text(
                        _founderUsers[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                          '${_founderUsers[index]['Industry'].toString()}',
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
