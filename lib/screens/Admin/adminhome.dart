import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  String bookname;
  String author;
  int price;
  int year;
  int id;
  String category;

  @override
  Widget build(BuildContext context) {
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
              Container(
                child: Center(
                  child: Text(
                    'Add Books',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                margin:
                    EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
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
                        obscureText: false,
                        onSubmitted: (String bknm) {
                          bookname = bknm;
                        },
                        decoration: InputDecoration(
                            hintText: 'Book Name',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextField(
                        obscureText: false,
                        onSubmitted: (String auth) {
                          author = auth;
                        },
                        decoration: InputDecoration(
                            hintText: 'Author Name',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextField(
                        obscureText: false,
                        onSubmitted: (String prc) {
                          price = int.parse(prc);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Price',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextField(
                        obscureText: false,
                        onSubmitted: (String identity) {
                          id = int.parse(identity);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Id',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextField(
                        obscureText: false,
                        onSubmitted: (String cat) {
                          category = cat;
                        },
                        decoration: InputDecoration(
                            hintText: 'Category',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextField(
                        obscureText: false,
                        onSubmitted: (String yr) {
                          year = int.parse(yr);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Year',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (author != null &&
                      bookname != null &&
                      category != null &&
                      id != null &&
                      price != null &&
                      year != null) {
                    Books newBook = Books(
                        author: author,
                        category: category,
                        id: id,
                        price: price,
                        title: bookname,
                        year: year);
                    await BooksDB.booksdbInstance.insertBook(newBook);
                    // print('KLl');
                  }
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
                  margin:
                      EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
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
  }
}
