import 'package:flutter/cupertino.dart';

final String tableBooks = 'books';

class BookFields {
  static final List<String> values = [id, title, category, year, price, author];

  static final String id = 'id';

  static final String title = 'title';

  static final String category = 'category';

  static final String price = 'price';

  static final String year = 'year';
  static final String author = 'author';
}

class Books {
  final int id;
  final String title;
  final String category;
  final int year;
  final int price;
  final String author;
  Books(
      {this.id, this.title, this.category, this.year, this.price, this.author});
  Books copy(
          {int id,
          String title,
          String category,
          int year,
          int price,
          String author}) =>
      Books(
          id: id,
          category: category ?? this.category,
          price: price ?? this.price,
          title: title ?? this.title,
          year: year ?? this.year,
          author: author ?? this.author);

  static Books fromJson(Map<String, Object> json) => Books(
      id: json[BookFields.id] as int,
      title: json[BookFields.title] as String,
      category: json[BookFields.category] as String,
      author: json[BookFields.author] as String,
      price: json[BookFields.price] as int,
      year: json[BookFields.year] as int);

  Map<String, Object> toJson() => {
        BookFields.id: id,
        BookFields.title: title,
        BookFields.category: category,
        BookFields.price: price,
        BookFields.year: year,
        BookFields.author: author
      };
}
