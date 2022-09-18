import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Providers/MeetingProvider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/main.dart';
import 'package:talkthrough/screen/Meeting/MeetingJoinInfoWidget.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import '../NavigationAuthScreen.dart/NavigationAutthScreen.dart';

class Meeting extends StatefulWidget {
  @override
  State<Meeting> createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  late MeetingProvider _meetingProvider;
  @override
  void initState() {
    // TODO: implement initState
    _meetingProvider = MeetingProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);
    double height =
        (MediaQuery.of(context).size.height - AppBar().preferredSize.height) -
            20;
    double width = MediaQuery.of(context).size.width - 20;
    TextEditingController meetingCode = TextEditingController();
    return ChangeNotifierProvider(
      create: (_) => _meetingProvider,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            title: Text("TalkThrew Room"),
            centerTitle: true,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Enter Your/Friends's TalkThrew Room Id",
                      style: jost(
                          size: height * 0.025, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Form(
                  key: meetingFormKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        // borderRadius: BorderRadius.circular(10),
                        fieldHeight: height * 0.08,
                        fieldWidth: width * 0.13,
                        activeFillColor: Colors.white,
                        selectedColor: Colors.green,
                        inactiveColor: Colors.green,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white),
                    hintCharacter: "0",
                    animationDuration: Duration(milliseconds: 250),
                    enableActiveFill: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (code) {
                      int length = code!.length;
                      if (length > 0 && length < 6)
                        return "Code shuld of length Greater Then 6";
                    },
                    onChanged: (code) {
                      _meetingProvider.setMeetingcode = code;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white10,
                  ),
                  padding: EdgeInsets.all(8),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Click on Profile To Change your UserName",
                      style: jost(
                        size: height * 0.005,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        italic: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                MeetingJoinInfoWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
