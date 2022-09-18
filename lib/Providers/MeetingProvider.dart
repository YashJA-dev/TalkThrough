import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MeetingProvider extends ChangeNotifier {
  bool isMicOn = false;
  bool isVideoOn = false;
  String meetingcode = "";
  bool get getIsMicOn => this.isMicOn;

  set setIsMicOn(bool isMicOn) {
    this.isMicOn = isMicOn;
    notifyListeners();
  }

  get getMeetingcode => this.meetingcode;

  set setMeetingcode(meetingcode) {
    this.meetingcode = meetingcode;
    notifyListeners();
  }

  get getIsVideoOn => this.isVideoOn;

  set setIsVideoOn(isVideoOn) {
    this.isVideoOn = isVideoOn;
    notifyListeners();
  }
}
