import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import 'NavigationAuthScreen.dart/NavigationAutthScreen.dart';

class Meeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(user!.email!),
            SizedBox(height: 50),
            RaisedButton(
              child: Text("sign Out"),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                logout(context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}
