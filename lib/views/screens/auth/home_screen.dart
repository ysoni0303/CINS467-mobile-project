import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:video_app/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final pages = [
  //   Text('Home Page'),
  //   Text('Search Page'),
  //   Text('Home Page'),
  //   Text('Message Page'),
  //   Text('Profile Page'),
  // ];


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
            icon: Icon(Icons.search, size: 30,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 30,),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 30,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30,),
            label: 'Person',
          ),
        ],
      ),
      body: pages[pageIndex]
    );
  }
}
