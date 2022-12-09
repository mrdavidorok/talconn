import 'package:flutter/material.dart';

class FindStartups extends StatefulWidget {
  const FindStartups({super.key});

  @override
  State<FindStartups> createState() => _FindStartupsState();
}

class _FindStartupsState extends State<FindStartups> {
  final _textCOntroller = TextEditingController();

  //store user search into a variable
  String userSearch = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(userSearch),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(child: Image(image: AssetImage('asset/search.gif'))),
            Center(
                child: Text(
              userSearch,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            TextField(
              controller: _textCOntroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'e.g: Ecommerce',
                suffixIcon: IconButton(
                  onPressed: () {
                    _textCOntroller.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: MaterialButton(
                onPressed: () {
                  //update the search text into our variable
                  setState(() {
                    userSearch = _textCOntroller.text;
                  });
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
