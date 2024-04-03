// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:lite_store/pages/authPages/authPage.dart';
import 'package:lite_store/pages/cartpage.dart';
// import 'package:lite_store/pages/authPages/authPage.dart';
import 'package:lite_store/pages/homepage.dart';
import 'package:lite_store/pages/index.dart';
import 'package:lite_store/pages/shoppage.dart';
import 'package:lite_store/pages/utils/landingPage.dart';
import 'package:lite_store/pages/utils/shop.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final Color bgcolor = Color.fromRGBO(216, 245, 245, 1);
  final Color pcolor = Color.fromRGBO(102, 221, 239, 1);
  final Color scolor = Color.fromARGB(255, 255, 238, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      home: LandingPage(),
      routes: {
        '/index': (context) => Index(),
        '/homepage': (context) => MyHomePage(),
        '/Shoppage': (context) => ShopPage(),
        '/cart': (context) => CartPage(),
        '/auth': (context) => AuthPage(),
        '/landing': (contex) => LandingPage(),
      },
    );
  }
}
