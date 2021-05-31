import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/user.dart';
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
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: GestureDetector(
                    onTap: () async {
                      if (userid != null &&
                          password != null &&
                          password != null) {
                        User user = User(
                            password: password,
                            userId: userid,
                            userType: 'user',
                            username: username);
                        BooksDB.booksdbInstance.insertUser(user);
                      } else {}

                      // print(user.userId);
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFFa7bbc7), Color(0xFFe1e5ea)])),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                      ),
                    ),
                  )),
            ]))
          ],
        ),
      ),
    );
  }
}
