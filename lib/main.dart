import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screen/HomeScreen.dart';
import 'screen/IntroAuthScreen/IntroAuthScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black
      ),
      home: NavigationPage(),
    );
  }
}
class NavigationPage extends StatelessWidget {
  bool isSigned=false;
  @override
  Widget build(BuildContext context) {
    return isSigned?HomeScreen():IntroAuthScreen();
  }
}