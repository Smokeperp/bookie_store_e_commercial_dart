import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart'; // Assuming this imports the generated routes like LoginRoute, NavigationMenuRoute
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperState();
}

class _WrapperState extends State<WrapperPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if(snapshot.data!.emailVerified){
            AutoRouter.of(context).replace(const NavigationMenuRoute());
          }else{
            AutoRouter.of(context).replace(const VerifyRoute());

          }
        } else {
          AutoRouter.of(context).replace(const LoginRoute());
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
