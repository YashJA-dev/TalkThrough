import 'package:flutter/cupertino.dart';

class ProfileInfoProvider extends ChangeNotifier {
  String _username;
  String _id;
  String _email;
  String _date;

  ProfileInfoProvider({
    required String username,
    required String id,
    required String email,
    required String date,
  })  : _username = username,
        _id = id,
        _email = email,
        _date = date;

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

  set setid(value) {
    this._id = value;
    notifyListeners();
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
