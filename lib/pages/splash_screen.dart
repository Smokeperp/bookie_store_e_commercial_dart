import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_store_e_commercial/navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Lottie.asset("assets/animations/sandyloading.json"),

          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.001,
            child: Text(
              'BookieStore',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
        nextScreen: const NavigationMenu() ,
      splashIconSize: 350,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      curve: Curves.easeInOutBack,
      animationDuration: const Duration(milliseconds: 1555),
    );
  }
}
