import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key, required this.books});

  final List<String> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(15),
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (_, index) {
        return Container(
          width: 130,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Text(books[index])),
        );
      },
    );
  }
}
