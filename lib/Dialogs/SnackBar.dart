import 'package:flutter/material.dart';

void showSnackMsg(
    {required String msg, required BuildContext context, int sec = 3}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Updated"),
      duration: Duration(seconds: sec),
    ),
  );
}
