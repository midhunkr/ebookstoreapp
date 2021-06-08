import 'package:ecommerceapp/cubit/newcubit_cubit.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCard extends StatefulWidget {
  const BookCard({
    this.userid,
    this.nameofauthor,
    this.nameofbook,
    this.price,
    this.bookid,
    Key key,
  }) : super(key: key);
  final int userid;
  final String nameofbook;
  final String nameofauthor;
  final int bookid;
  final int price;

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  int userId;
  bool bought = false;
  void initState() {
    userId = widget.userid;
    super.initState();
  }

  String buildConditionalText(NewcubitState state) {
    if (state is BookPurchased) {
      return 'Buy Again';
    }
    return 'Buy';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewcubitCubit, NewcubitState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.only(bottom: 10, top: 10, left: 15, right: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFffc996),
              border: Border.all(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(
                      10.0) //                 <--- border radius here
                  ),
            ),
            height: 150,
            width: 350,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFff8474),
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(
                            10.0) //                 <--- border radius here
                        ),
                  ),
                  height: 20,
                  width: 350,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
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
                              textData: widget.nameofbook,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: BookData(
                              metaData: 'Author',
                              textData: widget.nameofauthor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: BookData(
                              metaData: 'Price',
                              textData: widget.price.toString(),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          Purchase purchase = Purchase(
                              bookid: widget.bookid,
                              bookname: widget.nameofbook,
                              price: widget.price,
                              userid: userId);
                          await BooksDB.booksdbInstance
                              .insertPurchase(purchase);
                          print('Hi');
                          setState(() {
                            bought = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(left: 20),
                          height: 80,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                bought ? 'Buy Again' : 'Buy',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
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
        Text(
          textData,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
