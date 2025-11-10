import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/features/home/pages/shop_page.dart';
import 'package:book_store_e_commercial/features/intro/pages/intro_page.dart';
import 'package:book_store_e_commercial/features/library/pages/library.dart';
import 'package:book_store_e_commercial/features/navigation/navigationbar.dart';
import 'package:book_store_e_commercial/features/search/search.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: NavigationMenuRoute.page,
      path: '/', 
      children: [
        AutoRoute(
          page: LibraryRoute.page,
          path: 'library',
          ),
        AutoRoute(
          page: ShopRoute.page,
          path: 'shop',
          ),
        AutoRoute(
          page: SearchRoute.page,
          path: 'search',
          ),    
       ]
    ),
  ];
}