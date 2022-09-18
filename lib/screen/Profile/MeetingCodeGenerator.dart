import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/SnackBar.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/GoogleStyle.dart';
import 'package:uuid/uuid.dart';

import '../../Dialogs/LoadingDialog.dart';

class MeetingCodeGenerator extends StatelessWidget {
  const MeetingCodeGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext buildcontext) {
    double width = MediaQuery.of(buildcontext).size.width - 20;
    double height = MediaQuery.of(buildcontext).size.height;
    ProfileInfoProvider profileInfoProvider =
        Provider.of<ProfileInfoProvider>(buildcontext);
    late BuildContext? _dialogContext;
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width,
            height: height * 0.035,
            child: AutoSizeText(
              "${profileInfoProvider.username}'s Meeting Code",
              style: jost(size: height * 0.035, color: Colors.white70),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onLongPress: () {
                FlutterClipboard.copy(profileInfoProvider.id).then(
                  (value) {
                    showSnackMsg(
                        context: buildcontext,
                        msg:
                            "Meeting Code ${profileInfoProvider.id} Copied To ClipBoard");
                  },
                );
              },
              child: AutoSizeText(
                profileInfoProvider.id,
                style: jost(size: height * 0.05, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              // width: width - 50,
              child: ElevatedButton(
                child: AutoSizeText(
                  "Generate New Meeting Code",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  String code = Uuid().v1().substring(0, 6);
                  showDialog(
                    context: buildcontext,
                    builder: (context) {
                      _dialogContext = context;
                      return LoadingDialog(width: width, height: height);
                    },
                  );
                  bool response = await profileInfoProvider.setid(code);
                  Navigator.pop(_dialogContext!);
                  if (response) {
                    showSnackMsg(msg: "Updated", context: buildcontext);
                  } else {
                    showSnackMsg(
                        msg: "Network Problem Try Again:(",
                        context: buildcontext);
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.black12
                          : null;
                    },
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
