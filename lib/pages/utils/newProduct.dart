// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lite_store/pages/utils/product.dart';
import 'package:lite_store/pages/utils/shop.dart';
import 'package:provider/provider.dart';

class newProduct extends StatelessWidget {
  final Product product;

  const newProduct({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('Add this item to your cart'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().addToCart(product);
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
    final Color faidBg = Color.fromRGBO(109, 235, 255, 0.858);
    return Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                        width: 280,
                        height: 50,
                        child: Center(
                          child: Text('GET UP TO 30% OFF', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                        ),
                      ),
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Stack(
                    children: [
                      
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            color: bgcolor,
                            borderRadius: BorderRadius.circular(1),
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.all(3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.asset(product.imagePath),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          height: 30,
                          width: 70,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('new',style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 6,
                          bottom: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(131, 0, 0, 0),
                                    offset: Offset(2, 2),
                                    blurRadius: 0.7,
                                  )
                                ]),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + (product.price - product.price*0.3).toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: scolor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
