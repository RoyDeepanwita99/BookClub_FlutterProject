import 'package:bookclub_dr/model/book.dart';
import 'package:flutter/material.dart';

class Cart {
  List<Book> cartItems = [];

  void addBook(Book book) {
    cartItems.add(book);
  }

  void removeBook(Book book) {
    cartItems.remove(book);
  }

  void clearCart() {
    cartItems.clear();
  }
}
