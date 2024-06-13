import 'package:bookclub_dr/model/book.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Book> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: cartItems[index].image,
                  ),
                  title: Text(cartItems[index].name),
                  subtitle: Text('by ${cartItems[index].author}'),
                  trailing: Text('${cartItems[index].pages} pages'),
                );
              },
            ),
    );
  }
}
