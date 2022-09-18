import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/EditDialog.dart';
import 'package:talkthrough/Style/GoogleStyle.dart';
import 'package:talkthrough/screen/Profile/MeetingCodeGenerator.dart';
import 'package:talkthrough/screen/Profile/ProfileAppbar.dart';
import 'package:talkthrough/screen/Profile/ProfileDetailWidget.dart';

import '../../Providers/ProfileInfoProvider.dart';
import '../NavigationAuthScreen.dart/NavigationAutthScreen.dart';
import '../controller/AuthScreen.dart';
import 'ProfileImageWidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(color: Colors.indigo),
        // appBar:
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileAppBar(),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ProfileImageWidget(),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: height * 0.08,
                  width: MediaQuery.of(context).size.width - 20,
                  child: AutoSizeText(
                    profileInfo.username,
                    style: montserratStyle(
                        size: height * 0.08,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton.icon(
                  onPressed: () {
                    editDialog(
                      buildcontext: context,
                      title: "Enter New User Name",
                      profileInfoProvider: profileInfo,
                    );
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit User Name"),
                  textColor: Colors.white,
                ),
              ),
              ProfileDetailWidget(),
              Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: MeetingCodeGenerator(),
                ),
              ),
            ],
          ),
        ));
  }
}
