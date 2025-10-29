import 'package:book_store_e_commercial/navigationbar.dart';
import 'package:book_store_e_commercial/pages/shop_page.dart';
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
      theme: lightMode, color: Colors.black,
      home: const NavigationMenu(),
      routes: {
        '/shop_page': (context) => const ShopPage(),
        '/navigation_menu': (context) => const NavigationMenu(),
      },
    );
  }
}
