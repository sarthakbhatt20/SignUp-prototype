import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String? name, email, mobile, collegename;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(183, 86, 255, 64),
      appBar: AppBar(title: Text('Signup')),
      body: SingleChildScrollView(
        child: Form(
            key: _key,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Image(
                    image: AssetImage('images/logo.png'),
                    width: 100.0,
                    height: 100.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input) {
                        if (input == "") {
                          return 'Enter Name';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Name'),
                      onSaved: (input) => name = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email_rounded),
                    title: TextFormField(
                      validator: (input) {
                        if (input == "") {
                          return 'Enter an email';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (input) => email = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android_rounded),
                    title: TextFormField(
                      validator: (input) {
                        if (input == "") {
                          return 'Enter Mobile';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Mobile'),
                      onSaved: (input) => mobile = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school_rounded),
                    title: TextFormField(
                      validator: (input) {
                        if (input == "") {
                          return 'Enter College';
                        }
                      },
                      decoration: InputDecoration(labelText: 'College Name'),
                      onSaved: (input) => collegename = input,
                    ),
                  ),
                  ButtonTheme(
                      height: 50.0,
                      minWidth: 200.0,
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: _sendToNextPage,
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      )),
                  Padding(padding: EdgeInsets.all(10.0)),
                ],
              ),
            )),
      ),
    );
  }

  _sendToNextPage() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => HomePage(
                    name: name ?? '',
                    mobile: mobile ?? '',
                    email: email ?? '',
                    collegename: collegename ?? '',
                  ))));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
