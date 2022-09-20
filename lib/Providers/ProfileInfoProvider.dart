import 'package:flutter/cupertino.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

class ProfileInfoProvider extends ChangeNotifier {
  String _username;
  String _id;
  String _email;
  String _date;
  bool _meetingRunning = false;
  ProfileInfoProvider({
    required String username,
    required String id,
    required String email,
    required String date,
  })  : _username = username,
        _id = id,
        _email = email,
        _date = date;
  bool get meetingRunning => this._meetingRunning;

  Future<bool> SetmeetingStatus(bool value) async {
    bool response = await updateMeetigStatusFireStore(meeting: value);
    if (response) {
      this._meetingRunning = value;
      notifyListeners();
      return true;
    }
    return false;
  }

  get email => this._email;
  String get username => this._username;
  get date => this._date;
  set setDate(v) {
    _date = v;
    notifyListeners();
  }

  set setusername(String value) {
    this._username = value;

    notifyListeners();
  }

  get id => this._id;

  Future<bool> setid(code) async {
    this._id = code;
    bool response = await updateId(code: code);
    if (response) notifyListeners();
    return response;
  }

  set usernameNotNotify(String value) {
    this._username = value;
  }

  set idNotNotify(String value) {
    this._id = value;
  }

  set dateNotNotify(String value) {
    this._date = value;
  }

  //emailNotNotify
  set emailNotNotify(String value) {
    this._email = value;
  }
}
