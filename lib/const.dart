import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'views/add_video_page.dart';
import 'views/profile_page.dart';
import 'views/search_page.dart';
import 'views/video_page.dart';
import 'controllers/auth.dart';

List pages = [
  VideoPage(),
  SearchPage(),
  AddVideoPage(),
  ProfilePage(uid: authController.user.uid),
];

const backgroundColor = Colors.black;
var buttonColor = Colors.red;
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var authController = AuthController.instance;
