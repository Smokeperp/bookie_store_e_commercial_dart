import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final List<String> books;

  const GridList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((_, index) {
          
          return Container(
            width: 50,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text( 
                books[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }, childCount: books.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
      ),
    );
  }
}
