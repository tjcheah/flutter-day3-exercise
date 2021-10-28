import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Page',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Sign Up Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String gender = 'Gender';
  bool enableBtn = false;
  String? name, email, password;

  void checkText() {
    if (name != "" && email != "" && password != "" && gender != "Gender") {
      enableBtn = true;
    } else {
      enableBtn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweet2'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              Container(
                child: new Image.asset('assets/logo.png'),
                alignment: Alignment.center,
                height: 100,
                width: 100,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  child: TextField(
                onChanged: (String newValue) {
                  setState(() {
                    name = newValue;
                  });
                  checkText();
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              )),
              Container(
                  child: TextField(
                onChanged: (String newValue) {
                  setState(() {
                    email = newValue;
                  });
                  checkText();
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              )),
              Container(
                  child: TextField(
                onChanged: (String newValue) {
                  setState(() {
                    password = newValue;
                  });
                  checkText();
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              )),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: DropdownButton<String>(
                      value: gender,
                      isExpanded: true,
                      itemHeight: 50,
                      icon: const Icon(Icons.expand_more),
                      iconSize: 24,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                        checkText();
                      },
                      items: <String>['Gender', 'Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        "Pick your gender",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ))),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  onPressed: enableBtn? (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Awesome! Successful sign in.'),
                      ),
                    );
                  }: null,
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
