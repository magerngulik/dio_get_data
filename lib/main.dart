import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uas/Autentikasi/login_screen.dart';
import 'package:uas/Autentikasi/signup_screen.dart';
import 'package:uas/Screens/bottom_bar.dart';
import 'package:uas/Screens/detail_news.dart';
import 'package:uas/Screens/home_screens.dart';
import 'package:uas/Screens/rating_screens.dart';
import 'package:uas/Screens/search_screen.dart';
import 'package:uas/Screens/splash_screens.dart';
import 'package:uas/Screens/testing_screens.dart';

var routes = <String, WidgetBuilder>{
  "/HomeScreen": (BuildContext context) => HomeScreen(),
  "/BottomBar": (BuildContext context) => BottomBar(),
  "/Search": (BuildContext context) => SearchScreen(),
  "/LoginScreen": (BuildContext context) => LoginScreen(),
  "/SignUpScreen": (BuildContext context) => SignUpScreen(),
};

// void main() async {
//
//   return runApp(MaterialApp(
//     title: 'UAS',
//     theme: ThemeData.dark(),
//     home: const SignUpScreen()),);
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          primarySwatch: Colors.blue,
          primaryColorDark: Colors.lightBlueAccent),
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
      routes: routes,
    );
  }
}
