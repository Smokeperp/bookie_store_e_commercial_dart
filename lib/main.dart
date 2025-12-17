import 'package:book_store_e_commercial/core/book/abstract_book_repository.dart';
import 'package:book_store_e_commercial/core/book/book_repository.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/core/themes/theme.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

