// ignore_for_file: depend_on_referenced_packages

import 'package:client_pemob_app/src/Utils/utils.dart';
import 'package:client_pemob_app/src/screens/login_page/login_page.dart';
import 'package:client_pemob_app/src/screens/navbar_screen/bottom_navbar.dart';
import 'package:client_pemob_app/src/screens/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.grey[900],
        secondary: Colors.grey[800],
      )),
      home: SplashScreen(),
    );
  }
}
