import 'package:flutter/material.dart';
import 'package:shoes_app/src/pages/shoe_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: shoePage()
    );
  }
}