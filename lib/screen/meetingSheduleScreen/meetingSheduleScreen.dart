import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MeetingSheduleScreen extends StatefulWidget {
  @override
  State<MeetingSheduleScreen> createState() => _MeetingSheduleScreenState();
}

class _MeetingSheduleScreenState extends State<MeetingSheduleScreen> {
  final user = FirebaseAuth.instance.currentUser;
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Home"),
    //     ),
    //     body: Center(
    //         child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Text(user!.email!),
    //         SizedBox(height: 50),
    //         RaisedButton(
    //           child: Text("sign Out"),
    //           color: Colors.blue,
    //           onPressed: () {
    //             print("out");
    //             FirebaseAuth.instance.signOut();
    //             Navigator.pushAndRemoveUntil<dynamic>(
    //               context,
    //               MaterialPageRoute<dynamic>(
    //                 builder: (BuildContext context) => NavigationAutthScreen(),
    //               ),
    //               (route) =>
    //                   false, //if you want to disable back feature set to false
    //             );
    //           },
    //         )
    //       ],
    //     ),
    //     ),
    // );
    return Scaffold(
        appBar: AppBar(title: Text("Bottom Nav Bar")),
        // body: SizedBox.expand(
        //   child: PageView(
        //     controller: _pageController,
        //     onPageChanged: (index) {
        //       setState(() => _currentIndex = index);
        //     },
        //     children: <Widget>[
        //       Profile(),
        //       Container(
        //         color: Colors.red,
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          onTabChangedListener: (position) {
            setState(() {
              _currentIndex = position;
            });
          },
        ));
  }
}
