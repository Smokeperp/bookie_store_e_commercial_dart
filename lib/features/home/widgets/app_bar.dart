import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppBarShop extends StatelessWidget {
  const AppBarShop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      expandedHeight: 80,
      leadingWidth:  MediaQuery.sizeOf(context).width * 0.15,
      leading: IconButton(
        iconSize:  MediaQuery.sizeOf(context).width * 0.09,
        onPressed: () {
          AutoRouter.of(context).push(const ProfileUserRoute());
        }, 
      icon: Icon(Iconsax.profile_circle),
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(Colors.white),
        overlayColor:WidgetStatePropertyAll(Colors.transparent), 
      ),
      
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text("Home", style: TextStyle(color: Colors.white)),
      ),
      
    );
  }
}
