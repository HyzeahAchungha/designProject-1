// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_name, unused_import, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lite_store/pages/cartpage.dart';
import 'package:lite_store/pages/favorite.dart';
import 'package:lite_store/pages/homepage.dart';
import 'package:lite_store/pages/notification.dart';
import 'package:lite_store/pages/profile.dart';
import 'package:lite_store/pages/shoppage.dart';
import 'package:lite_store/pages/utils/drawer.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexPage();
}

class _IndexPage extends State<Index> {
  final List<Widget> _Pages = [
    MyHomePage(),
    FavoritePage(),
    NotificationPage(),
    ProfilePage(),
  ];
  final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
  final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
  final Color scolor = Color.fromARGB(255, 255, 238, 0);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/landing');
    print('sign');
  }

  selectedI(context) {
    if (_selectedIndex == context) {
      return scolor;
    } else {
      return Colors.black;
    }
  }

  int _selectedIndex = 0;

  void _navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: bgcolor,
        backgroundColor: bgcolor,
        title: Text('LITE_store'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.shopping_cart)),
        ],
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: bgcolor,
        child: DrawerL(),
      ),
      body: _Pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          onTap: _navigate,
          backgroundColor: bgcolor,
          items: [
            Icon(Icons.home, color: selectedI(0)),
            Icon(Icons.favorite, color: selectedI(1)),
            Icon(Icons.notifications, color: selectedI(2)),
            Icon(Icons.person, color: selectedI(3)),
          ]),
    );
  }
}
