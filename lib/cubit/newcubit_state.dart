part of 'newcubit_cubit.dart';

@immutable
abstract class NewcubitState {}

class NewcubitInitial extends NewcubitState {}

class LoginFailed extends NewcubitState {
  final String message;
  LoginFailed({this.message});
}

class AdminScreen extends NewcubitState {}

class UserScreen extends NewcubitState {
  final int userid;
  UserScreen({this.userid});
}

class LoadingUser extends NewcubitState {}

class LoadingUserCompleted extends NewcubitState {
  LoadingUserCompleted({this.listofPurchases});
  final List<Purchase> listofPurchases;
}

class BookAdded extends NewcubitState {}

class BookPurchased extends NewcubitState {}

class BooksLoading extends NewcubitState {}

class BooksLoaded extends NewcubitState {
  final List<Books> books;
  BooksLoaded({this.books});
}

class NewBookCanBeAdded extends NewcubitState {}

class SignupSuccess extends NewcubitState {}

// class HomeUser extends NewcubitState {}

// class BuyBooks extends NewcubitState {}

// class BookPurchase extends NewcubitState {}

// class BookPurchasedLoading extends NewcubitState {}
