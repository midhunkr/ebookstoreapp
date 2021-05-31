import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/screens/utils/bookcard.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:flutter/material.dart';

class BuyBooks extends StatefulWidget {
  @override
  _BuysBooksState createState() => _BuysBooksState();
}

class _BuysBooksState extends State<BuyBooks> {
  List<Books> books;
  bool isLoading;
  void initState() {
    super.initState();
    refreshBooksAgain();
  }

  Future refreshBooksAgain() async {
    setState(() => isLoading = true);

    this.books = await BooksDB.booksdbInstance.readAllBooks();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading == true
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  CustomAppbar(
                    textl: 'Buy Books',
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) => BookCard(
                      nameofauthor: books[index].author,
                      nameofbook: books[index].title,
                      price: books[index].price,
                    ),
                  )),
                ],
              ));
  }
}