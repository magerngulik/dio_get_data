import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uas/Autentikasi/login_footer_widget.dart';
import 'package:uas/Autentikasi/login_form_widget.dart';
import 'package:uas/Autentikasi/login_header_widget.dart';
import 'package:uas/Screens/bottom_bar.dart';
import 'package:uas/constant/size.dart';
import 'package:uas/constant/image.dart';
import 'package:uas/constant/text.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultLoginSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LoginHeaderWidget(),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
