import 'package:ecommerceapp/constants/constants.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/user.dart';
import 'package:ecommerceapp/screens/Admin/adminhome.dart';
import 'package:ecommerceapp/screens/Home/home_screen.dart';
import 'package:ecommerceapp/screens/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInSignUP extends StatefulWidget {
  @override
  _SignInSignUPState createState() => _SignInSignUPState();
}

class _SignInSignUPState extends State<SignInSignUP> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  String userName;

  String password;

  bool wronguser = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Center(child: Logo()),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                    child: TextField(
                      controller: controller1,
                      onSubmitted: (String value) {
                        userName = value;
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
                      controller: controller2,
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
                  if (wronguser)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Wrong Credentials',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        onTap: () async {
                          print(userName);
                          print(password);
                          User user;
                          if (userName != null && password != null) {
                            user = await BooksDB.booksdbInstance
                                .readUser(userName, password);
                            if (user.userId == -1) {
                              setState(() {
                                wronguser = true;
                              });
                            } else {
                              // setState(() {
                              //   wronguser = false;
                              // });
                              print(user.userType);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          }
                          // print(user.userId);
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFc8c2bc),
                                    Color(0xFFf2dac3)
                                  ])),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInSignUP()));
                          // print(user.userId);
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFa7bbc7),
                                    Color(0xFFe1e5ea)
                                  ])),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
