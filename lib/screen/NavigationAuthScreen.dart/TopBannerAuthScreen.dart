import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:provider/provider.dart';

import '../../Providers/AuthScreenProvider.dart';
import '../../Style/montserrat.dart';

class TopBannerAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthScreenProvider authScreen = Provider.of<AuthScreenProvider>(context);
    bool login = authScreen.login;
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    return Container(
      height: size.height,
      width: width,
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: GradientColors.blue)),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: size.height*0.20),
      child: AnimatedDefaultTextStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
        style: damion(
            size: login ? 35 : 33,
            color: Colors.white,
            fontWeight: FontWeight.w400),
        child: Text(
          login ? "Login Screen" : "SignUp",
        ),
      ),
    );
  }
}
