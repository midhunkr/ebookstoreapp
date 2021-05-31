import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/model/user.dart';
import 'package:flutter/material.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<Books> books;
  User user;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    refreshBooks();
  }

  Future refreshBooks() async {
    setState(() => isLoading = true);
    await BooksDB.booksdbInstance.database;
    this.books = await BooksDB.booksdbInstance.readAllBooks();
    this.user = await BooksDB.booksdbInstance.readUser('midhun', 'fermions');
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(books[index].title),
                  subtitle: Text(books[index].category),
                  leading:
                      user.userId == -1 ? Text('Invalid') : Text(user.username),
                );
              },
              itemCount: books.length,
            ),
    );
  }
}
