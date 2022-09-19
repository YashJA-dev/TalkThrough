import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/SnackBar.dart';
import 'package:talkthrough/Providers/MeetingProvider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';

joinMeeting(
    {required ProfileInfoProvider profileInfo,
    required MeetingProvider meetingInfo,
    required BuildContext context}) async {
  // ProfileInfoProvider profileInfo = Provider.of<ProfileInfoProvider>(context);
  // MeetingProvider meetingInfo = Provider.of<MeetingProvider>(context);
  try {
    Map<FeatureFlagEnum, bool> featureFlag = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.MEETING_PASSWORD_ENABLED:true,
      FeatureFlagEnum.MEETING_NAME_ENABLED:true,
      FeatureFlagEnum.RECORDING_ENABLED:true,

    };
    
    if (Platform.isAndroid) {
      featureFlag[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    } else if (Platform.isIOS) {
      featureFlag[FeatureFlagEnum.PIP_ENABLED] = false;
    }

    var options = JitsiMeetingOptions(room: meetingInfo.meetingcode)
      ..audioMuted = meetingInfo.isMicOn
      ..userDisplayName = profileInfo.username
      ..videoMuted = meetingInfo.isVideoOn
      ..userEmail=profileInfo.email
      ..featureFlags.addAll(featureFlag);
      
      
    await JitsiMeet.joinMeeting(options).whenComplete((){
      // print("joined meeting kapp");
    });
    
  } catch (ex) {
    showSnackMsg(msg: ex.toString(), context: context);
  }
}
