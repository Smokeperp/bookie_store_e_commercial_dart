import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/features/home/pages/shop_page.dart';
import 'package:book_store_e_commercial/features/library/pages/library.dart';
import 'package:book_store_e_commercial/features/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

@RoutePage()
class NavigationMenuPage extends StatefulWidget {
  const NavigationMenuPage({Key? key}) : super(key: key);

  @override
  State<NavigationMenuPage> createState() => _NavigationMenuPageState();
}

class _NavigationMenuPageState extends State<NavigationMenuPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: [
          ShopRoute(),
          LibraryRoute(),
          SearchRoute()
        ],
        builder: (context, child){
          final tabsRouter = AutoTabsRouter.of(context); 
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              indicatorColor: Colors.white,
              height: 80,
              elevation: 0,
              onDestinationSelected: (index) => _openPage(index, tabsRouter),
              destinations:  [
              
              NavigationDestination(icon: Icon(Iconsax.home, color: tabsRouter.activeIndex == 0 ? Colors.black : Colors.grey ,), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.book_saved,  color: tabsRouter.activeIndex == 1 ? Colors.black : Colors.grey), label: 'Library'),
              NavigationDestination(icon: Icon(Iconsax.search_normal_1_copy,  color: tabsRouter.activeIndex == 2 ? Colors.black : Colors.grey), label: 'Search'),
            ],
            labelTextStyle: WidgetStatePropertyAll(
              TextStyle(color: Colors.white)
            ),
            overlayColor: WidgetStatePropertyAll(
              Colors.grey
            ),
              ),
          );
        }
      ),
    );
  }


  void _openPage(index, TabsRouter tabsRouter){
    tabsRouter.setActiveIndex(index); 
  }
}



