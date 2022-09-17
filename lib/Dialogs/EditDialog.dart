import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Dialogs/LoadingDialog.dart';
import 'package:talkthrough/Providers/ProfileInfoProvider.dart';
import 'package:talkthrough/screen/Profile/Profile.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import '../Style/montserrat.dart';
import 'SnackBar.dart';

Future<void> editDialog({
  required BuildContext buildcontext,
  required String title,
  required profileInfoProvider,
}) async {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  return showDialog<void>(
    context: buildcontext,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext bcontext) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: TextFormField(
              controller: controller,
              validator: (value) {
                int length = value!.length;
                if (length == 0) {
                  return "legth should be greater then 0";
                } else if (length > 15) {
                  return "length should be less then 15";
                } else {
                  return null;
                }
              },
              maxLength: 15,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: title,
                hintText: "${title}",
                prefixIcon: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(buildcontext).pop();
            },
          ),
          TextButton(
            child: const Text('Update'),
            onPressed: () async {
              bool valid = _formKey.currentState!.validate();
              if (valid) {
                Navigator.of(buildcontext).pop();
                BuildContext? dialogContext;
                showDialog(
                  context: buildcontext,
                  builder: (buildcontext) {
                    dialogContext = buildcontext;
                    return LoadingDialog(
                        width: MediaQuery.of(buildcontext).size.width,
                        height: MediaQuery.of(buildcontext).size.height);
                  },
                );
                bool response = await updateUserName(userName: controller.text);
                if (response) {
                  profileInfoProvider.setusername = controller.text;
                  showSnackMsg(context: buildcontext,msg: "Updated..");
                } else {
                  showSnackMsg(context: buildcontext,msg: "Network Problem Try Again");
                }
                Navigator.pop(dialogContext!);
              }
            },
          ),
        ],
      );
    },
  );
}
