import 'package:book_store_e_commercial/features/shop/Home/pages/shop_page.dart';
import 'package:book_store_e_commercial/features/shop/library/pages/library.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorController controller = Get.put(NavigatorController());
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.selectedIndex.value,
        children: controller.pages,
      )
      ),
      bottomNavigationBar:
       Obx(() =>
        NavigationBar(
            indicatorColor: Colors.white,
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },


            destinations:  [
              
              NavigationDestination(icon: Icon(Iconsax.home, color: controller.selectedIndex.value == 0 ? Colors.black : Colors.grey ,), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.book_saved,  color: controller.selectedIndex.value == 1 ? Colors.black : Colors.grey), label: 'Library'),
              NavigationDestination(icon: Icon(Iconsax.search_normal_1_copy,  color: controller.selectedIndex.value == 2 ? Colors.black : Colors.grey), label: 'Search'),
            ],
            labelTextStyle: WidgetStatePropertyAll(
              TextStyle(color: Colors.black)
            ),
            overlayColor: WidgetStatePropertyAll(
              Colors.grey
            ),
          )),
    );
  }
}



class NavigatorController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  
  final List<Widget> pages = [
  ShopPage(),
  libraryScreen(),
  Center(child: Text("Search")),
];
  Color iconColor= Colors.black;
}