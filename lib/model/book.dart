import 'package:flutter/material.dart';

class Book {
  final String name;
  final String author;
  final double rating;
  final int pages;
  final Image image;
  bool isInCart;
  bool isInWishlist;

  Book({
    required this.name,
    required this.author,
    required this.rating,
    required this.pages,
    required this.image,
    this.isInCart = false,
    this.isInWishlist = false,
  });
}
