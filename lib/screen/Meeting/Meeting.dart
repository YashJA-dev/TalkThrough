import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import '../NavigationAuthScreen.dart/NavigationAutthScreen.dart';

class Meeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);
    double height =
        (MediaQuery.of(context).size.height - AppBar().preferredSize.height) -
            20;
    double width = MediaQuery.of(context).size.width - 20;
    TextEditingController meetingCode = TextEditingController();
    return Container(
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
              children: [
                Text(
                  "Enter Your/Friends's Room Id",
                  style:
                      jost(size: height * 0.025, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Form(
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
                    controller: meetingCode,
                    validator: (code) {
                      int length = code!.length;
                      if (length > 0 && length < 6)
                        return "Code shuld of length Greater Then 6";
                    },
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(
                  height: height*0.01,
                ),
                Container(
                  width: width,
                  height: height * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 240, 240),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      )),
                  child: Text(
                    "Join With User Name ${profileInfo.username}",
                    style: jost(
                      size: height * 0.025,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      italic: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
