import 'package:flutter/foundation.dart';

class AuthScreenProvider extends ChangeNotifier {
  bool _login = true;

  bool get login => this._login;

  void tougleLogin(){
    this._login =!this._login ;
    notifyListeners();
  }
}
