import 'package:flutter/material.dart';

void showSnackMsg(
    {required String msg, required BuildContext context, int sec = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: Duration(seconds: sec),
    ),
  );
}
