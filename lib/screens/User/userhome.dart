import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:ecommerceapp/screens/utils/customrappbar.dart';
import 'package:ecommerceapp/screens/utils/purchasedbookcard.dart';
import 'package:flutter/material.dart';

class UserBook extends StatefulWidget {
  @override
  _UserBookState createState() => _UserBookState();
}

class _UserBookState extends State<UserBook> {
  List<Purchase> purchases;
  bool isLoading;
  void initState() {
    super.initState();
    fetchInfo();
  }

  Future fetchInfo() async {
    setState(() {
      isLoading = true;
    });
    this.purchases = await BooksDB.booksdbInstance.readAllPurchases();
    print('JkL');
    setState(() {
      isLoading = false;
    });
  }

  Future delete() async {
    await BooksDB.booksdbInstance.deletePurchasedBooks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CustomAppbar(
                  textl: 'User',
                ),
                Container(
                  child: purchases.length == 0
                      ? Text('No Books Purchased')
                      : Text('Purchased Books'),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: purchases.length,
                      itemBuilder: (context, index) => PurchasedBookCard(
                            bookname: purchases[index].bookname,
                            price: purchases[index].price,
                          )),
                ),
                GestureDetector(
                  child: Icon(Icons.access_alarm),
                  onTap: () {
                    delete();
                    setState(() {});
                  },
                )
              ],
            ),

      // : Column(
      //     children: [
      //       CustomAppbar(
      //         textl: 'Buy',
      //       ),

      //       Text(purchases.length.toString())
      //     ],
      //   ),
    );
  }
}
