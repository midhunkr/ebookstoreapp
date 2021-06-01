import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Buy/buybookss.dart';
import '../User/userhome.dart';

class HomeScreen extends StatefulWidget {
  final int userid;
  HomeScreen({this.userid});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int userId;
  @override
  void initState() {
    super.initState();
    userId = widget.userid;
  }

  int selectedValue = 0;
  Future refreshBooks() async {
    await BooksDB.booksdbInstance.database;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selectedValue == 0) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else {
          setState(() {
            selectedValue = 0;
          });
        }
      },
      child: Scaffold(
        body: selectedValue == 1
            ? BuyBooks(userid: userId)
            : UserBook(
                userid: userId,
              ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (currentValue) {
            print(currentValue);
            setState(() {
              selectedValue = currentValue;
            });
          },
          currentIndex: selectedValue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_rounded), label: 'Buy Books')
          ],
        ),
      ),
    );
  }
}
