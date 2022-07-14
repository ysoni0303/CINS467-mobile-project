import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Commment Screen',
            style: TextStyle(
              fontSize: 20,
            )), // Text // Center
      ), // Scaffold
    );
  }
}
