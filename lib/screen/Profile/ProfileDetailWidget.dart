import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Style/GoogleStyle.dart';

import '../../Providers/ProfileInfoProvider.dart';

class ProfileDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: height * 0.035,
            child: AutoSizeText(
              "Email",
              style: jost(size: height * 0.035, color: Colors.white70),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: width,
            height: height * 0.035,
            child: AutoSizeText(
              profileInfo.email,
              style: jost(size: height * 0.035, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.done_all_sharp),
              label: Text("Verifired"),
              // colorBrightness: Brightness.,
              textColor: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
