import 'package:flutter/material.dart';

class Book {
  final String name;
  final String author;
  final double rating;
  final int pages;
  final Image image;

  static var length; // New property for the book cover image

  Book({
    required this.name,
    required this.author,
    required this.rating,
    required this.pages,
    required this.image, // Constructor parameter for the book cover image
  });
}
