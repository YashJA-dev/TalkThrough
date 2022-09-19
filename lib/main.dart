import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talkthrough/screen/Meeting/Meeting.dart';
import 'package:talkthrough/screen/TalkThrewHolderScreen/TalkThrewHolderScreen.dart';
import 'firebase_options.dart';
import 'screen/IntroAuthScreen/IntroAuthScreen.dart';
import 'screen/NavigationAuthScreen.dart/NavigationAutthScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

late SharedPreferences prefs;

final navigatorKey = GlobalKey<NavigatorState>();
final meetingFormKey = GlobalKey<NavigatorState>();

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

class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = FirebaseAuth.instance.currentUser != null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSharedPrefrence(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          bool onboarding = prefs.containsKey('onboarding');
          if (isSigned)
            return TalkThrewHolderScreen();
          else {
            if (onboarding) {
              return NavigationAutthScreen();
            }
          }
          return IntroAuthScreen();
        } else {
          return Scaffold();
        }
      },
    );
  }

  initializeSharedPrefrence() async {
    return prefs = await SharedPreferences.getInstance();
  }
}
