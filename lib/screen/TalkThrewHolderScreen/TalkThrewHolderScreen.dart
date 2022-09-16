import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talkthrough/screen/Meeting.dart';
import 'package:talkthrough/screen/Profile/Profile.dart';

class TalkThrewHolderScreen extends StatefulWidget {
  @override
  State<TalkThrewHolderScreen> createState() => _TalkThrewHolderScreenState();
}

class _TalkThrewHolderScreenState extends State<TalkThrewHolderScreen> {
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
   
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Meeting(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Meeting"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Profile",
          ),
        ],
        onTap: (ind){
          _pageController.animateToPage(ind, duration: Duration(milliseconds: 300), curve:Curves.easeIn );
          _currentIndex=ind;
          setState(() {
            _currentIndex;
          });

        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
