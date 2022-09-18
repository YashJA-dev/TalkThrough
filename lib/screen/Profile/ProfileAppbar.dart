import 'package:flutter/material.dart';

import '../controller/AuthScreen.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
