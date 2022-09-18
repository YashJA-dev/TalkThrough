import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/screen/Meeting/Meeting.dart';
import 'package:talkthrough/screen/Profile/Profile.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';
import 'package:uuid/uuid.dart';

import '../../Providers/ProfileInfoProvider.dart';
import '../controller/FirebaseConst.dart';

class TalkThrewHolderScreen extends StatefulWidget {
  @override
  State<TalkThrewHolderScreen> createState() => _TalkThrewHolderScreenState();
}

class _TalkThrewHolderScreenState extends State<TalkThrewHolderScreen> {
  final user = FirebaseAuth.instance.currentUser;
  // UserCredential signedUser=
  int _currentIndex = 0;
  late PageController _pageController;
  late ProfileInfoProvider profileInfoProvider;
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = new DateTime.now();
    profileInfoProvider = ProfileInfoProvider(
        id: "Loading..",
        username: "Loading..",
        email: "Loading..",
        date: new DateTime(now.year, now.month, now.day).toString(),);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userData(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var userInfo;
          if (snapshot.hasError) {
            print(snapshot.error);
            userInfo = {
              "username": "Net Unstable",
              "email": "Net Unstable",
              "id": "Net Unstable",
              "date": new DateTime(now.year, now.month, now.day).toString(),
            };
          } else if (snapshot.connectionState == ConnectionState.done) {
            userInfo = snapshot.data!.data() as Map<String, dynamic>;
          } else {
            userInfo = {
              "username": "Loading..",
              "email": "Loading..",
              "id": "Loading..",
              "date": new DateTime(now.year, now.month, now.day).toString(),
            };
          }
          if (userInfo["username"] != "Loading..") {
            profileInfoProvider.usernameNotNotify = userInfo["username"];
          }

          if (userInfo["email"] != "Loading..") {
            profileInfoProvider.emailNotNotify = userInfo["email"];
          }
          if (userInfo["id"] != "Loading..") {
            profileInfoProvider.idNotNotify = userInfo["id"];
          }
          if (userInfo["date"] != "Loading..") {
            profileInfoProvider.dateNotNotify = userInfo["date"];
          }

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ChangeNotifierProvider(
              create: (_) => profileInfoProvider,
              child: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (ind) {
                    changeIndex(index: ind);
                  },
                  children: <Widget>[
                    Meeting(),
                    Profile(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_call), label: "Meeting"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Profile",
                ),
              ],
              onTap: (ind) {
                _pageController.animateToPage(ind,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
                changeIndex(index: ind);
              },
              currentIndex: _currentIndex,
            ),
          );
        });
  }

  void changeIndex({required int index}) {
    _currentIndex = index;
    setState(() {
      _currentIndex;
    });
  }
}
