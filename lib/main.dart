import 'package:book_store_e_commercial/core/book/abstract_book_repository.dart';
import 'package:book_store_e_commercial/core/book/book_repository.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/core/themes/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  
  runApp(Book());

  final dio = Dio();

   GetIt.I.registerSingleton<AbstractBookRepository>(
    BookRepository(dio: dio)
   );
   
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
