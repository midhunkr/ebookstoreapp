import 'package:ecommerceapp/screens/signinsignupscrenn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  CustomAppbar({this.textl});
  final String textl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: Color(0xFF564a4a),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textl,
              style: TextStyle(
                  color: Color(0xFFfaf2da),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInSignUP()));
              },
              child: Icon(
                Icons.logout,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
