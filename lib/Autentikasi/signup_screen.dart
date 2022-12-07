import 'package:flutter/material.dart';
import 'package:uas/Autentikasi/form_header_widget.dart';
import 'package:uas/Autentikasi/login_screen.dart';
import 'package:uas/Autentikasi/signun_form_widget.dart';
import 'package:uas/Autentikasi/signup_footer_widget.dart';
import 'package:uas/constant/image.dart';
import 'package:uas/constant/size.dart';
import 'package:uas/constant/text.dart';
import 'package:uas/Autentikasi/login_screen.dart';

class SignUpScreen extends StatelessWidget {

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: tWelcomeImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}