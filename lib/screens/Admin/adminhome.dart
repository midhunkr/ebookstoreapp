import 'package:ecommerceapp/cubit/newcubit_cubit.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();

  String bookname;
  String author;
  int price;
  int year;
  int id;
  String category;
  Widget conditionalBuild(NewcubitState state) {
    if (state is BookAdded) {
      controller1.clear();
      controller2.clear();
      controller3.clear();
      controller4.clear();
      controller5.clear();
      controller6.clear();
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Added New Book',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewcubitCubit, NewcubitState>(
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
                child: Expanded(
              child: ListView(
                children: [
                  CustomAppbar(
                    textl: 'Admin',
                  ),
                  conditionalBuild(state),
                  Container(
                    child: Center(
                      child: Text(
                        'Add Books',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 40, bottom: 10, left: 20, right: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            stops: [0.3, 1],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFFcc9b6d), Color(0xFFf1ca89)]),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                            controller: controller1,
                            obscureText: false,
                            onSubmitted: (String bknm) {
                              bookname = bknm;
                            },
                            decoration: InputDecoration(
                                hintText: 'Book Name',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                        TextField(
                            controller: controller2,
                            obscureText: false,
                            onSubmitted: (String auth) {
                              author = auth;
                            },
                            decoration: InputDecoration(
                                hintText: 'Author Name',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                        TextField(
                            controller: controller3,
                            obscureText: false,
                            onSubmitted: (String prc) {
                              price = int.parse(prc);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Price',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                        TextField(
                            controller: controller4,
                            obscureText: false,
                            onSubmitted: (String identity) {
                              id = int.parse(identity);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Id',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                        TextField(
                            controller: controller5,
                            obscureText: false,
                            onSubmitted: (String cat) {
                              category = cat;
                            },
                            decoration: InputDecoration(
                                hintText: 'Category',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                        TextField(
                            controller: controller6,
                            obscureText: false,
                            onSubmitted: (String yr) {
                              year = int.parse(yr);
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Year',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue)))),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      BlocProvider.of<NewcubitCubit>(context).addNewBook(
                          author, bookname, category, id, price, year);
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      margin: EdgeInsets.only(
                          top: 40, bottom: 10, left: 20, right: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.40,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              // stops: [0.3, 1],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xFF4a503d), Color(0xFF8e9775)]),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
