import 'package:flutter/material.dart';

class AppBarShop extends StatelessWidget {
  const AppBarShop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
              centerTitle: true,
              pinned: true,
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
            ),
          );
  }
}