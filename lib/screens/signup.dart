import 'package:ecommerceapp/cubit/newcubit_cubit.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/user.dart';
import 'package:ecommerceapp/screens/utils/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username;
  String password;
  int userid;
  bool crctCredentials = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewcubitCubit, NewcubitState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 5),
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
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      onSubmitted: (String value) {
                        userid = int.parse(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'userid',
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: GestureDetector(
                        onTap: () async {
                          BlocProvider.of<NewcubitCubit>(context)
                              .insertNewUser(username, password, userid);
                          // } else {}

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
                  if (state is SignupSuccess) StatusScreen()
                ]))
              ],
            ),
          ),
        );
      },
    );
  }
}
