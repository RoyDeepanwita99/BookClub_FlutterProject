import 'package:bookclub_dr/model/book.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: book.image,
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            book.name,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Author: ${book.author}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 170),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.red, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: Text(
                          'Price ${book.pages}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color.fromARGB(255, 225, 226, 226),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Text(
                              ' ${book.rating}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Color.fromARGB(255, 191, 122, 228),
                            ),
                            Text(
                              ' ${book.pages} pages',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              color: Color.fromARGB(255, 110, 125, 239),
                            ),
                            Text(
                              ' English',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Dive into the world of ${book.name} by ${book.author}, a captivating [genre] novel. This  ${book.pages}-page book takes readers on a journey through [brief description of the main conflict or plot], set against the rich backdrop of [mention setting or significant locations].'),
                ],
              ),
              // Add more details if needed
            ],
          ),
        ),
      ),
    );
  }
}
