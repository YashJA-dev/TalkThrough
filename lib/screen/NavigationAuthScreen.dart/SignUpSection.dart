import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/screen/TalkThrewHolderScreen/TalkThrewHolderScreen.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import '../../Providers/AuthScreenProvider.dart';
import '../../Style/montserrat.dart';
import '../../main.dart';

class SignUpSection extends StatefulWidget {
  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  TextEditingController email = TextEditingController();
  late AuthScreenProvider authScreen;
  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
  String? _email_err ;
  String? _pass_err ;

  
  @override
  void initState() {
    super.initState();
    email.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    authScreen = Provider.of<AuthScreenProvider>(context);
    Size size = MediaQuery.of(context).size;
    bool login = authScreen.login;
    double height = size.height * 0.6;
    return Container(
      height: height,
      width: size.width,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 80, top: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTextSignUp(),
          buildEmailField(),
          buildPassWordField(),
          buildSignUpButton(),
          buildLoginButton(),
        ],
      ),
    );
  }
  Widget buildLoginButton(){
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: OutlinedButton(
              onPressed: () {
                authScreen.tougleLogin();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
              ),
              child: const Text("Log In"),
            ),
          ),
        )
      ],
    );
  }
  Widget buildEmailField() {
    return TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
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
          border: OutlineInputBorder()),
    );
  }

  Widget buildPassWordField() {
    return TextField(
      controller: password,
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

  void signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    String signin = await sigUp_controller(
        email: email.text.trim(), password: password.text.trim());
    if (signin == "1") {
      _pass_err = "Value Can\'t Be Empty";
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } else if (signin == "0") {
      _email_err = "Value Can\'t Be Empty";
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } else if (signin == "01") {
      _pass_err = "Value Can\'t Be Empty";
      _email_err = "Value Can\'t Be Empty";
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } else if (signin == "Successfully") {
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
  
  Widget buildSignUpButton() {
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
                  signUp();
                },
                child: Text("Sign Up"),
              ),
            ),
          )
        ],
      );
  }
  
  Widget buildTextSignUp() {
    return Text(
      "Sign Up",
      style: montserratStyle(size: 15, fontWeight: FontWeight.w700),
    );
  }
}
