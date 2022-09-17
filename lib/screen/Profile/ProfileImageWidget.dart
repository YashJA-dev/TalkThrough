import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/montserrat.dart';

class ProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;


    ProfileInfoProvider profileInfoProvider=Provider.of<ProfileInfoProvider>(context);
    return Container(
      width: width,
      height: height * 0.15,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Container(
            width: width * 0.55,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: width * 0.05),
            child: CircleAvatar(
              radius: height * 0.07,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(height * 0.07),
                child: Image.asset("images/profile.jpg"),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            height: height * 0.12,
            width: 1,
          ),
          Container(
            padding: EdgeInsets.only(left: 35, bottom: 20),
            // decoration: BoxDecoration(color: Colors.red),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Joined",
                  style: jost(
                      size: 13,
                      color: Colors.white54,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: height * 0.03,
                  width: width * 0.2,
                  child: FittedBox(
                    child: Text(
                      
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(profileInfoProvider.date)),
                      style: jost(
                          size: height * 0.07,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
