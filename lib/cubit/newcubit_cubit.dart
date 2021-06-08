import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/db/booksdb.dart';
import 'package:ecommerceapp/model/books.dart';
import 'package:ecommerceapp/model/purchase.dart';
import 'package:ecommerceapp/model/user.dart';
import 'package:meta/meta.dart';

part 'newcubit_state.dart';

class NewcubitCubit extends Cubit<NewcubitState> {
  NewcubitCubit() : super(NewcubitInitial());
  Future authenticateUser(String username, String password) async {
    User user;
    if (username != null && password != null) {
      user = await BooksDB.booksdbInstance.readUser(username, password);

      if (user.userId == -1) {
        emit(LoginFailed(message: 'Wrong Credentilas'));
      } else {
        if (user.userType == 'admin') {
          emit(AdminScreen());
        } else {
          emit(UserScreen(userid: user.userId));
        }
      }
    }
  }

  void fetchUserDetails(int userid) async {
    emit(LoadingUser());
    await Future.delayed(Duration(seconds: 1), () => 1);
    List<Purchase> purchases;
    purchases = await BooksDB.booksdbInstance.readAllPurchases(userid);
    emit(LoadingUserCompleted(listofPurchases: purchases));
  }

  void fetchAllBooks() async {
    emit(BooksLoading());
    List<Books> books;
    books = await BooksDB.booksdbInstance.readAllBooks();
    emit(BooksLoaded(books: books));
  }

  void purchaseBooks(int bookid, int price, String bookname, int userid) async {
    Purchase purchase = Purchase(
        bookid: bookid, bookname: bookname, price: price, userid: userid);
    await BooksDB.booksdbInstance.insertPurchase(purchase);
    emit(BookPurchased());
  }

  void insertNewUser(String username, String password, int userid) async {
    if (userid != null && password != null && password != null) {
      print(
          'the userid is $userid and the usernam is $username and the password is $password');
      User user = User(
          password: password,
          userId: userid,
          userType: 'user',
          username: username);
      await BooksDB.booksdbInstance.insertUser(user);
      emit(SignupSuccess());
    }
  }

  void addNewBook(String bookname, String author, String category, int id,
      int price, int year) async {
    if (author != null &&
        bookname != null &&
        category != null &&
        id != null &&
        price != null &&
        year != null) {
      Books newBook = Books(
          author: author,
          category: category,
          id: id,
          price: price,
          title: bookname,
          year: year);
      await BooksDB.booksdbInstance.insertBook(newBook);
      emit(BookAdded());
      await Future.delayed(Duration(seconds: 1), () => 1);
      emit(NewBookCanBeAdded());
    }
  }
}
