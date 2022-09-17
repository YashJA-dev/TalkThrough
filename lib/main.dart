import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talkthrough/screen/TalkThrewHolderScreen/TalkThrewHolderScreen.dart';
import 'firebase_options.dart';
import 'screen/IntroAuthScreen/IntroAuthScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.black,
      ),
      home: NavigationPage(),
    );
  }
}

class NavigationPage extends StatelessWidget {
  bool isSigned = FirebaseAuth.instance.currentUser != null;
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return MeetingSheduleScreen();
    //     } else {
    //       return IntroAuthScreen();
    //     }
    //   },
    // );
    return Scaffold(
        body: isSigned ? TalkThrewHolderScreen() : IntroAuthScreen());
  }
}
