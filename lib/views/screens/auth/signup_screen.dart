import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:video_app/const.dart';
// import 'package:video_app/controllers/auth_controller.dart';
import 'package:video_app/views/screens/auth/login_screen.dart';

class SignUp extends StatelessWidget {
  // const SignUp({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage('https://i.pickadummy.com/600x400'),
                    backgroundColor: Colors.blue,

                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                    onPressed: () => authController.pickImage(),
                    icon: Icon(Icons.add_a_photo),
                  ), // IconButton
                  )
                ],
              ),
              SizedBox(
                height: 20,

              ),
              

              TextField(
                  controller: _username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // BorderRadius.circular
                      ), // OutlineInputBorder
                      hintText: 'Username',
                      prefix: Icon(Icons.person)) // TextField
                  ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // BorderRadius.circular
                      ), // OutlineInputBorder
                      hintText: 'Email',
                      prefix: Icon(Icons.email)) // TextField
                  ),
              SizedBox(
                height: 20,
              ),
              TextField(
                   controller: _password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ), // BorderRadius.circular
                      ), // OutlineInputBorder
                      hintText: 'Password',
                      prefix: Icon(Icons.email)) // TextField
                  ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(5),
                ), // BoxDecoration
                child: InkWell(
                  onTap: () => authController.registerUser(_username.text, _email.text, _password.text, authController.profilePhoto),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ), // Texteld)
                  ),
                ),
              ),
        
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(
                      fontSize: 20,
                    ), // TextStyle
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => LoginScreen())));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 20, color: buttonColor), // TextStyle
                    ),
                  )
                ],
              ) // Row
            ],
          ),
        ), // Column
      ), // Container
    ); // Scaffold
  }
}
