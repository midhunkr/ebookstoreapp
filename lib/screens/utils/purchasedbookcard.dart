import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurchasedBookCard extends StatelessWidget {
  const PurchasedBookCard({
    this.bookname,
    this.price,
    Key key,
  }) : super(key: key);
  final String bookname;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFededd0),
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        height: 100,
        width: 350,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF907fa4),
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(
                        10.0) //                 <--- border radius here
                    ),
              ),
              height: 20,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: BookData(
                          metaData: 'Name',
                          textData: bookname,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: BookData(
                          metaData: 'Price',
                          textData: price.toString(),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: BookData(
                      //     metaData: 'Price',
                      //     textData: price.toString(),
                      //   ),
                      // )
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     Purchase purchase = Purchase(
                  //         bookid: bookid,
                  //         bookname: nameofbook,
                  //         price: price,
                  //         userid: 10);
                  //     await BooksDB.booksdbInstance.insertPurchase(purchase);
                  //     print('Hi');
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 10),
                  //     child: Container(
                  //       height: 50,
                  //       width: 60,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           'Buy',
                  //           style: TextStyle(
                  //               fontSize: 20, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       color: Colors.red,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookData extends StatelessWidget {
  const BookData({
    this.textData,
    this.metaData,
    Key key,
  }) : super(key: key);
  final String textData;
  final String metaData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          metaData,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 20,
        ),
        Text(textData),
      ],
    );
  }
}
