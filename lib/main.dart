import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/core/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Book());
}

class Book extends StatelessWidget {
  Book({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      routerConfig: _appRouter.config(), 
      
    );
  }
}
