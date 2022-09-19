import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Style/GoogleStyle.dart';
import 'package:talkthrough/screen/NavigationAuthScreen.dart/TopBannerAuthScreen.dart';

import '../../Providers/AuthScreenProvider.dart';
import 'LoginSection.dart';
import 'SignUpSection.dart';

class NavigationAutthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AuthScreenProvider(),
        child: NavigationAutthScreenBody(),
      ),
    );
  }
}

class NavigationAutthScreenBody extends StatelessWidget {
  bool login = true;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    Size size = mediaquery.size;
    double width = size.width;
    double height = size.height;
    bool keyboard = mediaquery.viewInsets.bottom != 0;
    AuthScreenProvider authScreen = Provider.of<AuthScreenProvider>(context);
    login = authScreen.login;
    return Stack(
      children: [
        TopBannerAuthScreen(),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            height: login ? height * 0.505 : height * 0.565,
            width: login ? width : width * 0.96,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: login ? Colors.white : Color.fromARGB(164, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            duration: Duration(milliseconds: 300),
            child: LoginSection(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            height: height * 0.535,
            width: width,
            // alignment: Alignment(2,  0),
            duration: Duration(milliseconds: 640),
            child: (login) ? Container() : SignUpSection(),
          ),
        )
      ],
    );
  }
}
