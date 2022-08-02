import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '/const.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

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
          backgroundColor: backgroundColor,
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
                Icons.add,
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
