import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/features/home/pages/home_navigation_screen.dart';
import 'package:book_store_e_commercial/features/home/pages/shop_page.dart';
import 'package:book_store_e_commercial/features/home/profile/pages.dart';
import 'package:book_store_e_commercial/features/intro/pages/intro_page.dart';
import 'package:book_store_e_commercial/features/library/pages/library.dart';
import 'package:book_store_e_commercial/features/login/login.dart';
import 'package:book_store_e_commercial/features/navigation/navigationbar.dart';
import 'package:book_store_e_commercial/features/registration/forgot.dart';
import 'package:book_store_e_commercial/features/registration/registration.dart';
import 'package:book_store_e_commercial/features/registration/verify.dart';
import 'package:book_store_e_commercial/features/search/search.dart';
import 'package:book_store_e_commercial/features/wrapper/wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WrapperRoute.page,
      path: '/',
      initial: true
    ),
    AutoRoute(
      page: NavigationMenuRoute.page,
      path: '/navigation', 
      children: [
        AutoRoute(
          page: LibraryRoute.page,
          path: 'library',
          ),
        AutoRoute(
          page: HomeNavigationRoute.page,
          path: 'shop',
          children: [
            AutoRoute(page: ProfileUserRoute.page, ),
            AutoRoute(page: ShopRoute.page, initial: true)
          ]
          ),
        AutoRoute(
          page: SearchRoute.page,
          path: 'search',
          ),    
       ]
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: RegistrationRoute.page,
      path: '/register',
    ),
    AutoRoute(
      page: ForgotRoute.page,
      path: '/forgot',
    ),
    AutoRoute(
      page: VerifyRoute.page,
      path: '/verify',
    ),
  ];
}