import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import'package:flutter/material.dart';
import 'package:video_app/const.dart';
import 'package:video_app/views/screens/auth/home_screen.dart';
import 'package:video_app/views/screens/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
  padding: EdgeInsets.all(20),
  alignment:Alignment.center,
  child:Column(
    mainAxisAlignment:MainAxisAlignment.center,
    children:[
      TextField(
        decoration:InputDecoration(
          border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(20),
          ),// OutlineInputBorder
          hintText:'Email',
          prefixIcon:Icon(Icons.email,),// Icon
        ),// Input Decoration
      ),// TextField
      SizedBox(height:15,)
 ,// SizedBox
TextField(
  decoration:InputDecoration(
    border:OutlineInputBorder(
      borderRadius:BorderRadius.circular(20),
    ),// OutlineInputBorder
    hintText:'Password',
    prefixIcon:Icon(
      Icons.lock,
),// Icon
),// Input Decoration
),
SizedBox(
  height:40
),
InkWell(
  onTap:(){},
  child:Container(
 width:MediaQuery.of(context).size.width-40,
 height:50,
 decoration:BoxDecoration(
  color:buttonColor,
  borderRadius:BorderRadius.circular(5),
  ),// BoxDecoration
child:Center(
  
  child:InkWell(
      onTap:(){
  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => HomeScreen())));
  },
    child: Text(
      'Login',
      style:TextStyle(fontSize:20,fontWeight: FontWeight.bold),
    ),
  ),// Texteld)
),
  ),
),

SizedBox(
  height:20,
),// SizedBox
Row(
  mainAxisAlignment:MainAxisAlignment.center,
  children:[
    Text('Dont"t have an Account?',
      style:TextStyle(fontSize:20),
    ),// Text
    SizedBox(width:5),
    InkWell(
  onTap:(){
  Navigator.of(context).push(MaterialPageRoute(builder: ((context) => SignUp())));
  },
child: Text(
  'Register',
  style:TextStyle(
    fontSize:20,
    color:buttonColor,
  ),// TextStyle
),// Text
    ),
  ],
)// Row
                                   



],
),// Column
),// Container

    );
  }
}