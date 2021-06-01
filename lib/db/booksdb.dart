import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:ecommerceapp/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BooksDB {
  static final booksdbInstance = BooksDB._init();
  static Database _database;
  BooksDB._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('bookss.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    List<User> userListTemp = [
      User(
          userId: 1,
          userType: 'user',
          password: 'fermions',
          username: 'midhun'),
      User(
          password: 'midhunkr',
          userType: 'admin',
          userId: 3,
          username: 'midhunkr')
    ];
    List<Books> bookListTemp = [
      Books(
          author: 'Jane Auston',
          id: 1,
          category: 'Fiction',
          price: 110,
          title: 'Pride And Prejudice',
          year: 2018),
      Books(
          author: 'Jane Auston',
          id: 2,
          category: 'Fiction',
          price: 110,
          title: 'Emma',
          year: 2018),
      Books(
          author: 'Arthur Conan Doyle',
          id: 4,
          category: 'Fiction',
          price: 110,
          title: 'Sherloc Holmes',
          year: 2018),
      Books(
          author: 'Arthur Conan Doyle',
          id: 5,
          category: 'Fiction',
          price: 110,
          title: 'Study In Scarlet',
          year: 2018),
      Books(
          author: 'Arthur Conan Doyle',
          id: 6,
          category: 'Fiction',
          price: 110,
          title: 'Valley Of Fear',
          year: 2018),
      Books(
          author: 'Dante',
          id: 7,
          category: 'Fiction',
          price: 110,
          title: 'Divine Comedy',
          year: 2018),
      Books(
          author: 'Mark Twain',
          id: 8,
          category: 'Fiction',
          price: 110,
          title: 'The Adventures of Tom Swayer',
          year: 2018),
    ];

    final idType = 'INTEGER PRIMARY KEY  ';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    final idTypeInteger = 'INTEGER ';

    await db.execute('''
CREATE TABLE $tableBooks(
    ${BookFields.id} $idType,
    ${BookFields.author} $textType,
    ${BookFields.title} $textType,
    ${BookFields.category} $textType,
    ${BookFields.price} $integerType,
    ${BookFields.year} $integerType)
    ''');
    await db.execute('''
    CREATE TABLE $tablePurchase(
      ${PurchaseFields.bookid} $idTypeInteger,
      ${PurchaseFields.userid} $idTypeInteger,
      ${PurchaseFields.price} $idTypeInteger,
      ${PurchaseFields.nameofbook} $textType
    )
     ''');

    await db.execute('''
    CREATE TABLE $userTable(
      ${UserFields.userid} $idType,
      ${UserFields.username} $textType,
      ${UserFields.password} $textType,
      ${UserFields.usertype} $textType
    )
     ''');

    final jid = await db.insert(tableBooks, bookListTemp[0].toJson());
    final jid1 = await db.insert(tableBooks, bookListTemp[1].toJson());
    final jid2 = await db.insert(tableBooks, bookListTemp[2].toJson());
    final jid3 = await db.insert(tableBooks, bookListTemp[3].toJson());
    final jid4 = await db.insert(tableBooks, bookListTemp[4].toJson());
    final jid5 = await db.insert(tableBooks, bookListTemp[5].toJson());
    final jid6 = await db.insert(userTable, userListTemp[0].toJson());
    final jid7 = await db.insert(userTable, userListTemp[1].toJson());
  }

  Future<int> deletePurchasedBooks() async {
    final db = await booksdbInstance.database;

    return await db.delete(
      tablePurchase,
    );
  }

  Future<Purchase> insertPurchase(Purchase purchase) async {
    final db = await booksdbInstance.database;
    final id = await db.insert(tablePurchase, purchase.toJson());
  }

  Future<List<Purchase>> readAllPurchases(int userid) async {
    final db = await booksdbInstance.database;

    // final orderBy = '${BookFields.price} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tablePurchase,
        columns: PurchaseFields.values,
        where: '${PurchaseFields.userid}=?',
        whereArgs: [userid]);

    return result.map((json) => Purchase.fromJson(json)).toList();
  }

  Future<User> insertUser(User user) async {
    final db = await booksdbInstance.database;
    final id = await db.insert(userTable, user.toJson());
    return user.copy(userid: id);
  }

  Future<User> readUser(String username, String password) async {
    final db = await booksdbInstance.database;
    final maps = await db.query(userTable,
        columns: UserFields.values,
        where: '${UserFields.username}=? AND ${UserFields.password}=?',
        whereArgs: [username, password]);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return User(userId: -1);
    }

    // return user.copy(userid: id);
  }

  Future<Books> insertBook(Books books) async {
    final db = await booksdbInstance.database;
    final id = await db.insert(tableBooks, books.toJson());
    return books.copy(id: id);
  }

  Future<List<Books>> readAllBooks() async {
    final db = await booksdbInstance.database;

    final orderBy = '${BookFields.price} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableBooks, orderBy: orderBy);

    return result.map((json) => Books.fromJson(json)).toList();
  }

  Future<Books> readBooks(int id) async {
    final db = await booksdbInstance.database;

    final maps = await db.query(
      tableBooks,
      columns: BookFields.values,
      where: '${BookFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Books.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateBook(Books book) async {
    final db = await booksdbInstance.database;

    return db.update(
      tableBooks,
      book.toJson(),
      where: '${BookFields.id} = ?',
      whereArgs: [book.id],
    );
  }

  Future<int> deleteBook(int id) async {
    final db = await booksdbInstance.database;

    return await db.delete(
      tableBooks,
      where: '${BookFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await booksdbInstance.database;

    db.close();
  }
}
