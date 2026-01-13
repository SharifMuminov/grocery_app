import 'package:flutter/material.dart';
import 'package:grocery_app/pages/detail_product/detail_product_page.dart';
import 'package:grocery_app/pages/home/home_page.dart';
import 'package:grocery_app/pages/on_boarding/on_boarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF9F9F9)),
      home: const OnBoardingPage(),
      // home: const DetailProductPage(),
    );
  }
}
