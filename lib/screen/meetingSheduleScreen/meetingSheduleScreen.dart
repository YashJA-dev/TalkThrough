import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkthrough/screen/NavigationAuthScreen.dart/NavigationAutthScreen.dart';

import '../IntroAuthScreen/IntroAuthScreen.dart';

class MeetingSheduleScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    print("came");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(user!.email!),
          SizedBox(height: 50),
          RaisedButton(
            child: Text("sign Out"),
            color: Colors.blue,
            onPressed: () {
              print("out");
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => NavigationAutthScreen(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
              );
            },
          )
        ],
      )),
    );
  }
}
