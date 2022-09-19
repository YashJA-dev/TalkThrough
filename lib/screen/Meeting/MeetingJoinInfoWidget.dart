import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/LoadingDialog.dart';
import 'package:talkthrough/Dialogs/SnackBar.dart';
import 'package:talkthrough/Providers/MeetingProvider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/GoogleStyle.dart';
import 'package:talkthrough/main.dart';
import 'package:talkthrough/screen/controller/JoinMeeting.dart';

import '../controller/AuthScreen.dart';

class MeetingJoinInfoWidget extends StatefulWidget {
  Function resetPinCode;
  MeetingJoinInfoWidget({required this.resetPinCode});

  @override
  State<MeetingJoinInfoWidget> createState() => _MeetingJoinInfoWidgetState();
}

class _MeetingJoinInfoWidgetState extends State<MeetingJoinInfoWidget> {
  @override
  void initState() {
    // TODO: implement initState
    // print("joined meeting kapp");
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
  //  print("joined meeting kapp");
    super.dispose();
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
  //  print("joined meeting kapp 2");
    
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    MeetingProvider meetingProvider = Provider.of<MeetingProvider>(context);
    ProfileInfoProvider profileInfoProvider =
        Provider.of<ProfileInfoProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width - 20;
    
    return Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: width,
            child: Column(
              children: [
                CheckboxListTile(
                  value: meetingProvider.isMicOn,
                  onChanged: (mic) {
                    meetingProvider.setIsMicOn = mic!;
                  },
                  activeColor: Colors.indigo,
                  subtitle: Text("Audio In Meeting"),
                  title: Text(
                    "Audio Mutted",
                    style: montserratStyle(size: width * 0.06),
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                CheckboxListTile(
                  value: meetingProvider.isVideoOn,
                  onChanged: (mic) {
                    meetingProvider.setIsVideoOn = mic!;
                  },
                  subtitle: Text("Video In Meeting"),
                  activeColor: Colors.indigo,
                  title: Text(
                    "Video Mutted",
                    style: montserratStyle(size: width * 0.06),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                SizedBox(
                  width: width - 20,
                  child: Text(
                    "Of Course, you can customise your settings in the meeting",
                    textAlign: TextAlign.center,
                    style:
                        jost(size: height * 0.02, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(
                  height: height * 0.1,
                  thickness: 2,
                ),
                InkWell(
                  onTap: () async {
                    BuildContext? _dialogcontext;
                    int codelength = meetingProvider.meetingcode.length;
                    if (codelength == 6) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          _dialogcontext = context;
                          return LoadingDialog(width: width, height: height);
                        },
                      );
                      bool response = await checkUserWithCode(
                          code: meetingProvider.meetingcode);
                      if (!response) {
                        showSnackMsg(
                            msg: "Please Enter a Valid Room Id",
                            context: context);
                      } else {
                        await joinMeeting(
                            meetingInfo: meetingProvider,
                            context: context,
                            profileInfo: profileInfoProvider);
                      }
                      Navigator.pop(_dialogcontext!);
                      meetingProvider.setMeetingcode = "";
                      widget.resetPinCode();
                    }
                  },
                  child: Container(
                    width: width,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).primaryColor,
                    ),
                    padding: EdgeInsets.all(8),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Join Room ",
                        style: jost(
                          size: height * 0.005,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          italic: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
