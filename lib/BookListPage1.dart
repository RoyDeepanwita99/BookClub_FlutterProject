import 'package:bookclub_dr/BookDetailsScreen.dart';
import 'package:bookclub_dr/CartPage.dart';
import 'package:bookclub_dr/WishList.dart';
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
      name: 'Harry Potter',
      author: 'J.K. Rowling',
      rating: 4.0,
      pages: 200,
      image: Image.asset('harryPoter.jpg'), // Example image
    ),
    Book(
      name: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      rating: 4.8,

      pages: 208,
      image: Image.asset('assets/Gatsby.jpg'), // Example image
    ),
    Book(
      name: 'Life In Woods',
      author: 'Sarah John',
      rating: 3.8,
      pages: 373,
      image: Image.asset('unnamed.jpg'), // Example image
    ),
    Book(
      name: 'Great Expectation',
      author: 'Harper Lee',
      rating: 4.5,
      pages: 336,
      image: Image.asset('assets/Expectation.jpg'), // Example image
    ),

    // Add more books as needed
  ];

  List<Book> filteredBooks = [];
  List<Book> cartItems = [];
  List<Book> wishlistItems = [];
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
        title:
            //////////////////////////////////////////////////////////////////////////title
            // Text('Book List'),
            Text(
          "Find Best Book Today!!!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Example vibrant color
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        ///////////////////////////////////////////////////////////////////////////
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
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WishlistPage(wishlistItems: wishlistItems),
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
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
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
                                    Icons.book,
                                    color: Color.fromARGB(255, 145, 142, 142),
                                  ),
                                  Text(' ${filteredBooks[index].pages} pages'),
                                ],
                              ),
/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////...
                            ],
                          ),
                        ),
                        ////////////////////////////////////////////////add to cart
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: filteredBooks[index].isInCart
                                    ? Colors.blue.withOpacity(0.5)
                                    : Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  addToCart(filteredBooks[index]);
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                tooltip: 'Add to Cart',
                                color: filteredBooks[index].isInCart
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                              SizedBox(
                                  width: 8), // Add space between icon and text
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: filteredBooks[index].isInCart
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //////////////////////////////////////////////// add to wishlist
                        IconButton(
                          onPressed: () {
                            toggleWishlist(filteredBooks[index]);
                          },
                          icon: Icon(
                            filteredBooks[index].isInWishlist
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: filteredBooks[index].isInWishlist
                                ? Colors.red
                                : Colors.grey,
                          ),
                          tooltip: 'Add to Wishlist',
                        ),

                        ///////////////////////////////////////
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
      if (!book.isInCart) {
        cartItems.add(book);
      } else {
        cartItems.remove(book);
      }
      book.isInCart = !book.isInCart; // Toggle isInCart property
    });
    print('Added ${book.name} to cart!');
  }

  void toggleWishlist(Book book) {
    setState(() {
      book.isInWishlist = !book.isInWishlist;
      if (book.isInWishlist) {
        wishlistItems.add(book);
        print('Added ${book.name} to wishlist!');
      } else {
        wishlistItems.remove(book);
        print('Removed ${book.name} from wishlist!');
      }
    });
  }
}
