import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkthrough/screen/TalkThrewHolderScreen/TalkThrewHolderScreen.dart';
import 'package:talkthrough/screen/controller/AuthScreen.dart';

import '../../Providers/AuthScreenProvider.dart';
import '../../Style/GoogleStyle.dart';
import '../../main.dart';
import '../controller/ConstantMethods.dart';

class SignUpSection extends StatefulWidget {
  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  TextEditingController email = TextEditingController();
  late AuthScreenProvider authScreen;
  TextEditingController password = TextEditingController();
  var username = TextEditingController();
  bool passwordVisible = true;
  String? _email_err;
  String? _pass_err;
  final _signUpFormKey = GlobalKey<FormState>();

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
    double width = size.width - 32;
    return Container(
      height: height,
      width: size.width,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      alignment: Alignment.center,
      child: Form(
        key: _signUpFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTextSignUp(),
            buildEmailField(),
            buildUserNameField(),
            buildPassWordField(),
            buildSignUpButton(),
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton() {
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
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (str) {
        int length = str!.length;
        if (!isEmail(email: str)&&length>0) return "Enter a Valid Email";
      },
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
          border: OutlineInputBorder()),
    );
  }

  Widget buildUserNameField() {
    return TextFormField(
      controller: username,
      keyboardType: TextInputType.emailAddress,
      validator: (str) {
        int length = (str!.trim()).length;
        if (length < 4) return "User Name Character's must be greater then 3";
      },
      maxLength: 15,

      decoration: InputDecoration(
          labelText: "User Name",
          hintText: "Guest",
          prefixIcon: Icon(Icons.supervised_user_circle),
          border: OutlineInputBorder()),
    );
  }

  Widget buildPassWordField() {
    return TextFormField(
      controller: password,
      validator: (str) {
        int length = str!.length;
        
        if (length <= 8&&length>0)
          return "Password should be of length greater then 8";
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
        email: email.text.trim(), password: password.text.trim(),username:username.text);
    if (signin == "Successfully") {
      _email_err = null;
      _pass_err = null;
      email.text = "";
      password.text = "";
      username.text="";
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
                bool valid = _signUpFormKey.currentState!.validate();
                if (valid) {
                  signUp();
                }
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
      "Sign Up / Create New Account",
      style: montserratStyle(size: 15, fontWeight: FontWeight.w700),
    );
  }
}
