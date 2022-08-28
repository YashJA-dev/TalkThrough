import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talkthrough/Style/montserrat.dart';

import '../NavigationAuthScreen.dart/NavigationAutthScreen.dart';
import 'IntroPageData.dart';

class IntroAuthScreen extends StatelessWidget {
  double buttonSize=21    ;
  
  @override
  Widget build(BuildContext context) {
        List<IntroPageData> pageData =formListContent();
    Color primaryColor=Theme.of(context).primaryColor;
    return IntroductionScreen(
      pages: buildPageViewModels(pageData: pageData),
      onDone: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>NavigationAutthScreen()));
      },
      onSkip: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>NavigationAutthScreen()));
      },
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      next: Text("Next",
          style: montserratStyle(
              size: buttonSize, fontWeight: FontWeight.w700, color: primaryColor)),
      done: Text("Done",
          style: montserratStyle(
              size: buttonSize, fontWeight: FontWeight.w700, color: primaryColor)),
      skip: Text("Skip",
          style: montserratStyle(
              size: buttonSize, fontWeight: FontWeight.w700, color:primaryColor)),
    );
  }

  List<PageViewModel> buildPageViewModels(
      {required List<IntroPageData> pageData}) {
    List<PageViewModel> pages = [];
    for (IntroPageData data in pageData) {
      PageViewModel pageViewModel = PageViewModel(
        title: data.body,
        body: data.tile,
        image: data.image,
        decoration: PageDecoration(
            bodyTextStyle: montserratStyle(
              size: 20,
              color: Colors.black,
            ),
            titleTextStyle: montserratStyle(size: 25, color: Color.fromARGB(255, 59, 58, 58))),
      );
      pages.add(pageViewModel);
    }
    return pages;
  }

  List<IntroPageData> formListContent() {
    List<IntroPageData> pageData = [];
    double imageHeight=170;
    //welcome screen
    pageData.add(
      new IntroPageData(
        tile: "Welcome",
        body: "Welcome To Talk Through, The best video confrencing App",
        image: Image.asset(
          "images/welcome.jpg",
          height: imageHeight,
        ),
      ),
    );

    // join or start meeting
    pageData.add(
      new IntroPageData(
        tile: "Join Or Start Meeting",
        body: "Easy To use Interface, join or start meeting in fast time",
        image: Image.asset(
          "images/confrence.jpg",
          height: imageHeight,
        ),
      ),
    );
    //security page
    pageData.add(
      new IntroPageData(
        tile: "Security",
        body:
            "Your Security is Important for us, Our Servers are secure and reliable",
        image: Image.asset(
          "images/secureity.jpg",
          height: imageHeight,
        ),
      ),
    );
    return pageData;
  }
}
