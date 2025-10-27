import 'package:book_store_e_commercial/pages/intro_page.dart';
import 'package:book_store_e_commercial/pages/shop_page.dart';
import 'package:book_store_e_commercial/pages/splash_screen.dart';
import 'package:book_store_e_commercial/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Book());
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const SplashScreen(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
      },
    );
  }
}
