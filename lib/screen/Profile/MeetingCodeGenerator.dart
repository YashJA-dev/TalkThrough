import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:uuid/uuid.dart';

import '../../Dialogs/LoadingDialog.dart';

class MeetingCodeGenerator extends StatelessWidget {
  const MeetingCodeGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    double height = MediaQuery.of(context).size.height;
    ProfileInfoProvider profileInfoProvider =
        Provider.of<ProfileInfoProvider>(context);
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
            child: AutoSizeText(
              profileInfoProvider.id,
              style: jost(size: height * 0.05, color: Colors.white),
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
                    context: context,
                    builder: (context) {
                      _dialogContext = context;
                      return LoadingDialog(width: width,height:height);
                    },
                  );
                  bool response = await profileInfoProvider.setid(code);
                  Navigator.pop(_dialogContext!);
                  if (response) {
                    print("updated");
                  } else {
                    print("networkProblem");
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
