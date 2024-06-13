import 'package:bookclub_dr/BookListPage1.dart';
import 'package:bookclub_dr/CartPage.dart';
import 'package:bookclub_dr/model/Cart.dart';
import 'package:flutter/material.dart';

class BookHome extends StatefulWidget {
  final String? username;
  const BookHome({super.key, required this.username, required String email});

  @override
  State<BookHome> createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  String name = '';

  int _currentIndex = 0;

  final List<Map<String, String>> images = [
    {'path': 'assets/Bird.jpg', 'description': 'To kill a Mocking Bird'},
    {'path': 'assets/Expectation.jpg', 'description': 'Great Expectation'},
    {'path': 'assets/2.png', 'description': 'Abstract Art'},
    {'path': 'Gatsby.jpg', 'description': 'The Great Gatsby'},
  ];
  Cart cart = Cart();

  final List<Widget> _pages = [
    BookHomeContent(), // Main content for home page
    BookListPage1(), // Book list page
    //Center(child: Text("Settings Page")),
    CartPage(
      cartItems: [],
    ), // Settings page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BookClub"),
            // Adjust the width as needed for spacing
            Image.asset(
              'images.png', // Replace with your image path
              width: 100, // Adjust width as per your image size
              height: 60, // Adjust height as per your image size
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.shopping_cart),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => CartPage()),
        //       ).then((_) {
        //         setState(() {}); // Refresh state when returning from CartPage
        //       });
        //     },
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 199, 211),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('My Books'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Logout'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Books',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'cart',
          ),
        ],
      ),
    );
  }
}

class BookHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> images = [
      {'path': 'assets/Bird.jpg', 'description': 'To kill a Mocking Bird'},
      {'path': 'assets/Expectation.jpg', 'description': 'Great Expectation'},
      {'path': '2.png', 'description': 'Abstract Art'},
      {'path': 'Gatsby.jpg', 'description': 'The Great Gatsby'},
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFe6e6e6),
                prefixIcon: Icon(Icons.search),
                hintText: "Search your favourite book.....",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Suggestions", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Container(
              height: 250.0, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 200.0, // Adjust the width as needed
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.asset(
                                images[index]['path']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                images[index]['description']!,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text("See Also", style: TextStyle(fontSize: 20)),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Image(
                            image: AssetImage('crime.jpg'),
                            width: 100,
                            height: 100)
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Crime and Punishment',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Fyodor Dostoevsky"),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text("4.8"),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(Icons.text_rotation_angledown),
                                Text("208"),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      children: [
                        const Image(
                            image: AssetImage('good.jpg'),
                            width: 100,
                            height: 100)
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Company',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Fyodor Dostoevsky"),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text("4.8"),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(Icons.text_rotation_angledown),
                                Text("208"),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                // Add more rows as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
