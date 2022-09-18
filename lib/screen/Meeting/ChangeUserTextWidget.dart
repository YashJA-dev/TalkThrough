import 'package:flutter/material.dart';

import '../../Style/GoogleStyle.dart';

class ChangeUserTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height =
        (MediaQuery.of(context).size.height - AppBar().preferredSize.height) -
            20;
    double width = MediaQuery.of(context).size.width - 20;
    return Container(
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
    );
  }
}
