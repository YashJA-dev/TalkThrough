import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/Style/montserrat.dart';
import 'package:talkthrough/screen/TalkThrewHolderScreen/TalkThrewHolderScreen.dart';
import 'package:talkthrough/screen/controller/ConstantMethods.dart';

import '../../Providers/AuthScreenProvider.dart';
import '../../main.dart';
import '../controller/AuthScreen.dart';

class LoginSection extends StatefulWidget {
  @override
  State<LoginSection> createState() => _LoginSectionState();
}

final _loginFormKey = GlobalKey<FormState>();

class _LoginSectionState extends State<LoginSection> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late BuildContext dialogContext;
  bool passwordVisible = true;
  AuthScreenProvider? authScreen;
  String? _email_err = null;
  String? _pass_err = null;

  // @override
  // void dispose() {
  //   super.dispose();
  //   email.dispose();
  //   // print("dispose");
  //   password.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    authScreen = Provider.of<AuthScreenProvider>(context);
    bool login = authScreen!.login;
    var mediaquery = MediaQuery.of(context);
    double height = mediaquery.size.height * 0.6;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 60, top: 2),
      alignment: Alignment.center,
      child: Form(
        key: _loginFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildLoginText(),
            buildEmailField(),
            buildPassWordField(),
            buildLoginButton(),
            buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                authScreen!.tougleLogin();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
              ),
              child: const Text("Sign Up"),
            ),
          ),
        )
      ],
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      controller: email,
      validator: (str) {
        int length = str!.length;
        if(length==0)return "Email can't be empty";
        else if (!isEmail(email: str)) return "Enter a Valid Email";
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (_) {
        _email_err = null;
        setState(() {
          _email_err;
        });
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "name@example.com",
        errorText: _email_err,
        prefixIcon: Icon(Icons.mail),
        suffixIcon: email.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  email.clear();
                },
              ),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildPassWordField() {
    return TextFormField(
      controller: password,
      validator: (str) {
        int length = str!.length;
        if (length == 0) return "Password can't be empty";
        else if(length<=8)return "Password should be of length greater then 8";

      },
      onChanged: (_) {
        _pass_err = null;
        setState(() {
          _pass_err;
        });
      },
      decoration: InputDecoration(
          labelText: "Password",
          errorText: _pass_err,
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: () {
              passwordVisible = !passwordVisible;
              setState(() {
                passwordVisible;
              });
            },
          ),
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder()),
      obscureText: passwordVisible,
    );
  }

  buildLoginButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
              onPressed: () async {
                bool validation = _loginFormKey.currentState!.validate();
                if (validation) {
                  loginProcess();
                }
              },
              child: Text("Log in"),
            ),
          ),
        )
      ],
    );
  }

  void loginProcess() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          dialogContext = context;
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    String signin = await sigIn_controller(
        email: email.text.trim(), password: password.text.trim());
    if (signin == "Successfully") {
      _email_err = null;
      _pass_err = null;
      email.text = "";
      password.text = "";
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => TalkThrewHolderScreen(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    } else {
      _email_err = signin;
      _pass_err = signin;
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    setState(() {
      _email_err;
      _pass_err;
    });
  }

  Widget buildLoginText() {
    return Text(
      "Login",
      style: montserratStyle(size: 15, fontWeight: FontWeight.w700),
    );
  }
}
