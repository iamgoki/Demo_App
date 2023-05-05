import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:message_app/members.dart';
import 'package:message_app/login_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:message_app/main.dart';

import 'homepage.dart';

class Splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          "Images/logo.png",
          height: 80,
        ),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.sizeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.black);
    // Container(
    //     // color: bgcolor,
    //     child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Image.asset(
    //       "Images/logo.png",
    //       height: 80,
    //     ),
    //     //  Text(
    //     //   appname,
    //     //   style: TextStyle(fontSize: apptitle,color: Colors.white,decoration: TextDecoration.none)
    //     // )
    //   ],
    // ));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("----------------->home");
              return HomePage();
            } else {
              print("----------------------->login");
              return LoginScreen();
            }
          }),
    );
  }
}
