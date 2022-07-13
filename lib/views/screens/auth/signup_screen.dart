import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import'package:flutter/material.dart'; 

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:Container(
    child:Column(
      children:[
        TextField(
          decoration:InputDecoration(
            border:OutlineInputBorder(),
            ),
        )// TextField
      ],
    ),// Column
 ),// Container
                                 
);// Scaffold
  }
}