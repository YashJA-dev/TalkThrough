import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Providers/MeetingProvider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/main.dart';

class MeetingJoinInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MeetingProvider meetingProvider = Provider.of<MeetingProvider>(context);
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
                  onTap: () {
                    // bool valid=meetingFormKey.currentState.
                    print(meetingProvider.getMeetingcode);
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
