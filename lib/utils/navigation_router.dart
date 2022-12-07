import 'package:flutter/material.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/LoginScreen");
  }

  static void switchToSignUp(BuildContext context) {
    Navigator.pushNamed(context, "/SignUpScreen");
  }

  static void switchToHome(BuildContext context) {
    Navigator.pushNamed(context, "/HomeScreen");
  }

  static void switchToBottomBar(BuildContext context) {
    Navigator.pushNamed(context, "/BottomBar");
  }

  static void switchToSearch(BuildContext context) {
    Navigator.pushNamed(context, "/Search");
  }

  static void switchToProfile(BuildContext context) {
    Navigator.pushNamed(context, "/Profile");
  }

  static void switchToPengaturan(BuildContext context) {
    Navigator.pushNamed(context, "/Pengaturan");
  }

  static void TicketView(BuildContext context) {
    Navigator.pushNamed(context, "/TicketView");
  }
}
