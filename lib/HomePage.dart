import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, collegename;
  HomePage(
      {Key? key,
      required this.name,
      required this.email,
      required this.mobile,
      required this.collegename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
      ),
      body: Form(
          child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15.0)),
            Image(
              image: AssetImage('images/logo.png'),
              width: 100.0,
              height: 100.0,
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text(name),
            ),
            ListTile(
              leading: Icon(Icons.email_rounded),
              title: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone_android_rounded),
              title: Text(mobile),
            ),
            ListTile(
              leading: Icon(Icons.school_rounded),
              title: Text(collegename),
            ),
          ],
        ),
      )),
    );
  }
}
