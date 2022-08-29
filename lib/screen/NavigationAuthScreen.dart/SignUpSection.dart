import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/AuthScreenProvider.dart';
import '../../Style/montserrat.dart';

class SignUpSection extends StatefulWidget {
  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  bool passwordVisible = true;
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
    AuthScreenProvider authScreen = Provider.of<AuthScreenProvider>(context);
    Size size = MediaQuery.of(context).size;
    bool login = authScreen.login;
    bool signUp = login;
    print(signUp);
    double height=size.height*0.6;
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
          Text(
            "Sign Up",
            style: montserratStyle(size: 15, fontWeight: FontWeight.w700),
          ),
          // SizedBox(height: 40),
          buildEmailField(),
          // SizedBox(height: 40),
          buildPassWordField(),
          // SizedBox(height: 40),
          Row(
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
                    onPressed: () {},
                    child: Text("Sign Up"),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Row(
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
          ),
        ],
      ),
    );
  }

  Widget buildEmailField() {
    return TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "name@example.com",
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
}
