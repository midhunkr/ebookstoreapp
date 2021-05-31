final String tablePurchase = 'purchase';

class PurchaseFields {
  static final List<String> values = [bookid, userid, nameofbook, price];

  static final String bookid = 'bookid';
  static final String userid = 'userid';
  static final String nameofbook = 'name';

  static final String price = 'price';
}

class Purchase {
  final int bookid;
  final int userid;
  final String bookname;
  final int price;
  Purchase({this.bookid, this.bookname, this.price, this.userid});
  Purchase copy({int bookid, int userid, String bookname, int price}) =>
      Purchase(
          bookid: bookid ?? this.bookid,
          bookname: bookname ?? this.bookname,
          price: price ?? this.price,
          userid: userid ?? this.userid);

  static Purchase fromJson(Map<String, Object> json) => Purchase(
        bookid: json[PurchaseFields.bookid] as int,
        bookname: json[PurchaseFields.nameofbook] as String,
        price: json[PurchaseFields.price] as int,
        userid: json[PurchaseFields.userid] as int,
      );

  Map<String, Object> toJson() => {
        PurchaseFields.bookid: bookid,
        PurchaseFields.nameofbook: bookname,
        PurchaseFields.price: price,
        PurchaseFields.userid: userid
      };
}
