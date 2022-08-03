import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_video.dart';
import 'profile.dart';
import 'search.dart';
import 'video.dart';
import '../controllers/auth.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List pages = [
    VideoPage(),
    SearchPage(),
    AddVideoPage(),
    ProfilePage(isSearch: false, uid: AuthController.instance.user.uid),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
          backgroundColor: Colors.pink[100],
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
                size: 30,
              ),
              label: 'Upload',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: pages[pageIndex]);
  }
}
