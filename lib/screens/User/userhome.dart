import 'package:ecommerceapp/cubit/newcubit_cubit.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:ecommerceapp/screens/utils/purchasedbookcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBook extends StatefulWidget {
  final int userid;
  UserBook({this.userid});

  @override
  _UserBookState createState() => _UserBookState();
}

class _UserBookState extends State<UserBook> {
  List<Purchase> purchases;
  bool isLoading;
  int userId;
  void initState() {
    userId = widget.userid;
    BlocProvider.of<NewcubitCubit>(context).fetchUserDetails(userId);

    super.initState();
  }

  // Future fetchInfo() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   this.purchases = await BooksDB.booksdbInstance.readAllPurchases(userId);
  //   print('JkL');
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // Future delete() async {
  //   await BooksDB.booksdbInstance.deletePurchasedBooks();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewcubitCubit, NewcubitState>(builder: (context, state) {
      return SafeArea(
        child: conditionalBuild(state),
      );
    });
  }

  Widget conditionalBuild(NewcubitState state) {
    if (state is LoadingUser) {
      return Center(child: CircularProgressIndicator());
    } else if (state is LoadingUserCompleted) {
      return Column(
        children: [
          CustomAppbar(
            textl: 'User',
          ),
          Container(
            child: state.listofPurchases.length == 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'No Books Purchased ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Purchased Books',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: state.listofPurchases.length,
                itemBuilder: (context, index) => PurchasedBookCard(
                      bookname: state.listofPurchases[index].bookname,
                      price: state.listofPurchases[index].price,
                    )),
          ),
        ],
      );
    }
    return CircularProgressIndicator();
  }
}
