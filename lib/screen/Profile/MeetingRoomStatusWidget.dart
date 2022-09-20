import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/LoadingDialog.dart';
import 'package:talkthrough/Dialogs/SnackBar.dart';
import 'package:talkthrough/Providers/MeetingProvider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';

import '../../Style/GoogleStyle.dart';

class MeetingRoomStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);

    return Container(
      child: CheckboxListTile(
        title: Text(
          "Open Meeting Room",
          style: montserratStyle(size: width * 0.06, color: Colors.white),
        ),
        tileColor: Colors.white,
        selectedTileColor: Colors.black,
        checkColor: Colors.black,
        onChanged: (value) async {
          BuildContext? dialogContext = null;
          showDialog(
            context: context,
            builder: (context) {
              dialogContext = context;
              return LoadingDialog(width: width, height: height);
            },
          );
          bool response = await profileInfo.SetmeetingStatus(value!);
          Navigator.pop(dialogContext!);
          if (!response) {
            showSnackMsg(msg: "Network Connection", context: context);
          }
        },
        subtitle: Text(
          "${profileInfo.username}'s Meeting Room Status ",
          style: TextStyle(color: Colors.white70),
        ),
        activeColor: Colors.white,
        value: profileInfo.meetingRunning,
      ),
    );
  }
}
