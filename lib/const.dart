import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_app/views/add_video_screen.dart';
import 'package:video_app/views/profile_screen.dart';
import 'package:video_app/views/search_screen.dart';
import 'package:video_app/views/video_screen.dart';
import 'controllers/auth_controller.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  AddVideoScreen(),
  ProfileScreen(uid: authController.user.uid),
];

const backgroundColor = Colors.black;
var buttonColor = Colors.blue;

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;
