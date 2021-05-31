import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  String username;
  String password;
  int userid;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(children: [
              Text('Sign Up'),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                child: TextField(
                  onSubmitted: (String value) {
                    username = value;
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                child: TextField(
                  obscureText: false,
                  onSubmitted: (String pas) {
                    password = pas;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
