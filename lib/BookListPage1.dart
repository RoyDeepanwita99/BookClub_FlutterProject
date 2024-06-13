import 'package:bookclub_dr/BookDetailsScreen.dart';
import 'package:bookclub_dr/CartPage.dart';
import 'package:bookclub_dr/model/book.dart';
import 'package:flutter/material.dart';

class BookListPage1 extends StatefulWidget {
  const BookListPage1({Key? key}) : super(key: key);

  @override
  State<BookListPage1> createState() => _BookListPage1State();
}

class _BookListPage1State extends State<BookListPage1> {
  List<Book> books = [
    Book(
      name: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      rating: 4.5,
      pages: 336,
      image: Image.asset('assets/Bird.jpg'), // Example image
    ),
    Book(
      name: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      rating: 4.8,
      pages: 208,
      image: Image.asset('assets/Gatsby.jpg'), // Example image
    ),
    Book(
      name: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      rating: 4.5,
      pages: 336,
      image: Image.asset('assets/Bird.jpg'), // Example image
    ),
    Book(
      name: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      rating: 4.8,
      pages: 208,
      image: Image.asset('assets/Gatsby.jpg'), // Example image
    ),
    // Add more books as needed
  ];

  List<Book> filteredBooks = [];
  List<Book> cartItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredBooks = books;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterBooks(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                labelText: 'Search by book name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookDetailsScreen(book: filteredBooks[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: filteredBooks[index].image,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredBooks[index].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'by ${filteredBooks[index].author}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(' ${filteredBooks[index].rating}'),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  Text(' ${filteredBooks[index].pages} pages'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            addToCart(filteredBooks[index]);
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          tooltip: 'Add to Cart',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterBooks(String query) {
    List<Book> filteredList = [];
    if (query.isNotEmpty) {
      filteredList = books.where((book) {
        return book.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredList = books;
    }
    setState(() {
      filteredBooks = filteredList;
    });
  }

  void addToCart(Book book) {
    setState(() {
      cartItems.add(book);
    });
    print('Added ${book.name} to cart!');
  }
}
