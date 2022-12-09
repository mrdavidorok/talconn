import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostStartup(),
    );
  }
}

class PostStartup extends StatefulWidget {
  const PostStartup({super.key});

  @override
  State<PostStartup> createState() => _PostStartupState();
}

class _PostStartupState extends State<PostStartup> {
  List<dynamic> talents = [];

  String? talentId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.talents.add({"id": 1, "label": "Engineer"});
    this.talents.add({"id": 2, "label": "Designer"});
    this.talents.add({"id": 3, "label": "Marketer"});
    this.talents.add({"id": 4, "label": "Sales"});
    this.talents.add({"id": 5, "label": "Operations"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Post a Startup'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              Image(
                image: AssetImage('asset/Business.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Hello Founder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Fill the form below and we will find you a CoFounder',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Startup Name'),
                      hintText: 'Microsoft',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('What Problem does your startup solve?'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('What solution do you have in mind?'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Your skills'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FormHelper.dropDownWidget(
                context,
                'Select Required Talent',
                this.talentId,
                this.talents,
                (onChangedVal) {
                  this.talentId = onChangedVal;
                  print('Selected Talent: $onChangedVal');
                },
                (onValidateVal) {
                  if (onValidateVal == null) {
                    return 'Please select talent';
                  }

                  return null;
                },
                borderColor: Colors.deepPurple,
                borderRadius: 10,
                optionLabel: 'label',
                optionValue: 'id',
                paddingLeft: 15,
                paddingRight: 15,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('asset/image.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
