import 'package:ecommerceapp/screens/signinsignupscrenn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: Text(
                      'You have been successfully signed up.Exit and login again'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInSignUP()));
                    },
                    child: Center(
                      child: Text('Click here'),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
