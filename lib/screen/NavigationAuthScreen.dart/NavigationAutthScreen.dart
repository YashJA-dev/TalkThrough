import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/screen/NavigationAuthScreen.dart/TopBannerAuthScreen.dart';

import '../../Providers/AuthScreenProvider.dart';
import 'LoginSection.dart';
import 'SignUpSection.dart';

class NavigationAutthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_)=>AuthScreenProvider(),
        child: NavigationAutthScreenBody(),
      ),
      
    );
  }
}

class NavigationAutthScreenBody extends StatelessWidget  {
  bool login = true;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double width = size.width;
    double height=size.height;
    AuthScreenProvider authScreen=Provider.of<AuthScreenProvider>(context);
    login=authScreen.login;
    return Stack(
      children: [
        TopBannerAuthScreen(),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            height: login ?  height*0.6: height*0.630,
            width: login ? width : width * 0.96,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: login?Colors.white:Color.fromARGB(164, 255, 255, 255),
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
            duration: Duration(milliseconds: 600),
            child: SignUpSection(),
          ),
        )
      ],
    );
  }

}
