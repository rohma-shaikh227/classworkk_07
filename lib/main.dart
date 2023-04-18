import 'package:classworkk_07/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/cart.dart';
import 'pages/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Catalog App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}