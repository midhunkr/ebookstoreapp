import 'package:ecommerceapp/cubit/newcubit_cubit.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/screens/utils/bookcard.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyBooks extends StatefulWidget {
  final int userid;
  BuyBooks({this.userid});
  @override
  _BuysBooksState createState() => _BuysBooksState();
}

class _BuysBooksState extends State<BuyBooks> {
  List<Books> books;
  bool isLoading;
  int userId;
  void initState() {
    userId = widget.userid;
    super.initState();
    BlocProvider.of<NewcubitCubit>(context).fetchAllBooks();
  }

  Widget conditionalBookList(NewcubitState state) {
    if (state is BooksLoading) {
      return CircularProgressIndicator();
    } else if (state is BooksLoaded) {
      return Column(
        children: [
          CustomAppbar(
            textl: 'Buy Books',
          ),
          Expanded(
              child: ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) => BookCard(
              userid: userId,
              nameofauthor: state.books[index].author,
              nameofbook: state.books[index].title,
              price: state.books[index].price,
            ),
          )),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewcubitCubit, NewcubitState>(
      builder: (context, state) {
        return SafeArea(
          child: conditionalBookList(state),
        );
      },
    );
  }
}
