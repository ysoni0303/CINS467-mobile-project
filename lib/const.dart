import 'package:flutter/material.dart';
import 'package:video_app/views/screens/add_video_screen.dart';
import 'package:video_app/views/screens/video_screen.dart';

List pages = [
  VideoScreen(),
  Text('Messages 2'),
  AddVideoScreen(),
  Text('Messages 3'),
  Text('Messages Screen'),
];

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
