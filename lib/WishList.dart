import 'package:flutter/material.dart';
import 'package:bookclub_dr/model/book.dart';

class WishlistPage extends StatelessWidget {
  final List<Book> wishlistItems;

  const WishlistPage({Key? key, required this.wishlistItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text('Your wishlist is empty'),
            )
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: wishlistItems[index].image,
                  ),
                  title: Text(wishlistItems[index].name),
                  subtitle: Text('by ${wishlistItems[index].author}'),
                  trailing: Text('${wishlistItems[index].pages} pages'),
                );
              },
            ),
    );
  }
}
