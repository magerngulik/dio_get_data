import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas/Autentikasi/login_screen.dart';
import 'package:uas/Autentikasi/signup_screen.dart';
import 'package:uas/utils/navigation_router.dart';
import 'package:uas/utils/util.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => NavigationRouter.switchToLogin(context));
    // Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen())));
    // Timer(Duration(seconds: 5), () => NavigationRouter.switchToBottomBar(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.purpleAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // FlutterLogo(
                      //   size: 100.0,
                      // ),
                      Image(image: AssetImage("assets/images/splash.png")),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        Util.name,
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}