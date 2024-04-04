// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_name, prefer_interpolation_to_compose_strings, unused_local_variable
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_store/pages/utils/newProduct.dart';
import 'package:lite_store/pages/utils/productTile.dart';
import 'package:lite_store/pages/utils/searchBar.dart';
import 'package:lite_store/pages/utils/shop.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
    final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
    final Color scolor = Color.fromARGB(255, 255, 238, 0);

    final products = context.watch<Shop>().shop;

    return Container(
      color: bgcolor,
      child: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Search_Bar(),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    color: pcolor, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Newly admmited personels get a 20% discount ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: pcolor),
                    child: Center(
                      child: Text(
                        'Computers',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Phones',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Accessories',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Text(
                      'Pick from Landmarks most afordable and powerful tech-wear'),
                ),
                SizedBox(
                  height: 380,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return ProductTile(product: product);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: pcolor, borderRadius:BorderRadius.circular(10)),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Trending Products',style: TextStyle(fontSize: 18,color: Colors.white),),
                        Container(child: Row(
                          children: [
                            Icon(Icons.calendar_month_outlined,color: Colors.white,),
                            Text('Last Date 04/04/2024',style: TextStyle(fontSize: 13,color: Colors.white),),
                          ],
                        )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2,),),
                      child: Row(
                        children: [
                          Text('view all',style: TextStyle(fontSize: 15,color: Colors.white),),
                          Icon(Icons.arrow_right,color:Colors.white ,),
                        ],
                      ),
                    ),
                    
                  ],
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
              child: SizedBox(
                        height: 1010,
                        child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(15),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return newProduct(product: product);
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
