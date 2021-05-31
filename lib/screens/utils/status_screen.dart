import 'package:ecommerceapp/screens/signinsignupscrenn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 30, bottom: 10),
                  child: Center(
                    child: Text(
                      'You have been successfully signed up.Exit and login again',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInSignUP()));
                    },
                    child: Center(
                      child: Text(
                        'Click here',
                        style: TextStyle(color: Colors.red),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
