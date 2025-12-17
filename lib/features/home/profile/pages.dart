import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

@RoutePage()
class ProfileUserPage extends StatelessWidget {
  ProfileUserPage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    AutoRouter.of(context).replace(const LoginRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton( onPressed:() {
          AutoRouter.of(context).pop();
        } ,icon: Icon(Icons.arrow_back_ios), color: Colors.white, )
      ),
      body:
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
            Icon(Iconsax.profile_circle,size: MediaQuery.sizeOf(context).width * 0.30,),
          IconButton(onPressed: () => signOut(context), icon: Icon(Icons.logout)),
          Center(
            child: Text(user?.email ?? "No email"),
          ),
                
              
            ],
          ),
        )
     
    );
  }
}
