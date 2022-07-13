import 'package:flutter/material.dart';
import 'package:video_app/const.dart';
import 'package:video_app/views/screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
      ),
      home: LoginScreen(),
    );
  }
}