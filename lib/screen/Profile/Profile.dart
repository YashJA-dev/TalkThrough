import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/screen/Profile/ProfileDetailWidget.dart';

import '../NavigationAuthScreen.dart/NavigationAutthScreen.dart';
import '../controller/AuthScreen.dart';
import 'ProfileImageWidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            FlatButton.icon(
                label: Text("Log Out"),
                icon: Icon(Icons.logout_rounded),
                textColor: Colors.white,
                onPressed: () {
                  logout(context: context);
                }),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ProfileImageWidget()),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 200,
                        child: AutoSizeText(
                          'yash',
                          style: montserratStyle(
                              size: 55,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                      ),
                      OutlinedButton(
                          // label: Text(""),
                          child: Icon(Icons.edit_rounded),
                          // textColor: Colors.white,
                          style: ButtonStyle(
                            
                          ),
                          // color: Colors.white,
                          onPressed: () {
                            // logout(context: context);
                          }),
                    ]),
              ),
              ProfileDetailWidget(),
            ],
          ),
        ));
  }
}
