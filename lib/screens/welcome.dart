import 'package:ecommerceapp/constants/constants.dart';
import 'package:ecommerceapp/screens/signinsignupscrenn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF546EB6),
          body: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 300, 20, 50),
                  child: Logo()),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInSignUP()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFf7ea00),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFf7ea00),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 180.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black,
          //     offset: const Offset(
          //       5.0,
          //       5.0,
          //     ), //Offset
          //     blurRadius: 10.0,
          //     spreadRadius: 2.0,
          //   ), //BoxShadow
          // BoxShadow(
          //   color: Colors.white,
          //   offset: const Offset(0.0, 0.0),
          //   blurRadius: 0.0,
          //   spreadRadius: 0.0,
          // ), //BoxShadow
          // ],
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: kColor3),
          gradient: LinearGradient(
              colors: [Color(0xFFf5cebe), Color(0xFFf4eee8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Text(
          'E-Book \nApp',
          style: TextStyle(
              color: Color(0xFF3C6743),
              fontWeight: FontWeight.bold,
              fontSize: 50.0),
        ),
      ),
    );
  }
}
