import 'package:flutter/material.dart';

import '../Style/montserrat.dart';

class LoadingDialog extends StatelessWidget {
  double width;
  double height;
  Color backgroundColor;
  LoadingDialog(
      {required this.width,
      required this.height,
      this.backgroundColor = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * 0.9,
        height: height * 0.1,
        decoration: BoxDecoration(color: backgroundColor),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Loading...",
                style: montserratStyle(
                    size: height * 0.02, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 30,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
