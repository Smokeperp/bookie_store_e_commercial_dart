import 'dart:async';


import 'package:auto_route/annotations.dart';
import 'package:book_store_e_commercial/features/home/widgets/app_bar.dart';
import 'package:book_store_e_commercial/features/home/widgets/grid_list.dart';
import 'package:book_store_e_commercial/features/home/widgets/horizontal_list.dart';
import 'package:book_store_e_commercial/features/home/widgets/horizontal_recent_books.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ScrollController _controller = ScrollController();
  int currentIndex = 7;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        debugPrint('Reached the limit');
        loadNewBooks();
      }
    });
  }

  List<String> books = List.generate(10, (index) => 'Book #${index + 1}');
  bool isLoading = false;

  void loadNewBooks() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    final newBooks = List.generate(
      6,
      (index) => 'Book #${index + books.length + 1}',
    );

    await Future.delayed(Duration(seconds: 1));

    setState(() {
      books.addAll(newBooks);
      isLoading = false;
    });

    debugPrint((books.length).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          if (isLoading) {
            return false;
          } else {
            Future.delayed(Duration(seconds: 1));
            overscroll.disallowIndicator();
            return true;
          }
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: [

             AppBarShop(),
            
            SliverToBoxAdapter(
              child:
               SizedBox(height: 220, 
                child: HorizontalRecentBooks(books: books)
              ),
            ),


            SliverToBoxAdapter(
              child: SizedBox(height: 190, child: HorizontalList(books: books)),
            ),

            GridList(books: books),

            SliverToBoxAdapter(
              child:
                  isLoading
                      ? const Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
