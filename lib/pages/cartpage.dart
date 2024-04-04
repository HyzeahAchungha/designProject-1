// ignore_for_file: use_super_parameters, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:lite_store/pages/utils/mybutton.dart';
import 'package:lite_store/pages/utils/product.dart';
import 'package:lite_store/pages/utils/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('Remove this item from your cart'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
    final Color scolor = Color.fromARGB(255, 255, 238, 0);
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: bgcolor,
        backgroundColor: bgcolor,
        title: Text('Cart page'),
        elevation: 0,
      ),
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    }),
          ),
          GestureDetector(
            onTap: () {},
            child: Mybutton(
              w: 150,
              h: 60,
              t: 'Check out',
            ),
          )
        ],
      ),
    );
  }
}
