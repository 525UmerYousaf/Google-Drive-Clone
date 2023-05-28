// ignore_for_file: await_only_futures, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/login_screen.dart';
import './screens/nav_screen.dart';
import './authentication_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(
                  "Drive Clone is being initialized",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(
                  "Drive Clone has failed to connect.",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Root(),
          );
        }
      },
    );
  }
}
/*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(),
    );
  }
  */

class Root extends StatelessWidget {
  //  Now, i want to inject my auth controller dependency here
  //  instead of inside LoginScreen bcz I'm gonna work with
  //  auth controller here actually bcz it is starting of my
  //  app not the login screen. Therefore;
  //  Below I'm injecting my controller inside the widget.
  AuthController authController = Get.put(AuthController());

  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      //  It is the widget that implmenet changes reactively
      //  mainly used to implement Streams in Flutter.
      //  With the help of this I can depending on user state
      //  can now navigate the user to various screens.
      () {
        //  Below i am using Rx user used to get the value
        //  out of user.
        return authController.user.value == null
            ? const LoginScreen()
            : const NavScreen();
      },
    );
  }
}
