import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:video_app/const.dart';
import 'package:video_app/views/home_screen.dart';
import 'package:video_app/views/signup_screen.dart';

// class LoginScreen extends StatelessWidget {
//   // const LoginScreen({Key? key}) : super(key: key);

//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _email,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ), // OutlineInputBorder
//                 hintText: 'Email',
//                 prefixIcon: Icon(
//                   Icons.email,
//                 ), // Icon
//               ), // Input Decoration
//             ), // TextField
//             SizedBox(
//               height: 15,
//             ), // SizedBox
//             TextField(
//               controller: _password,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ), // OutlineInputBorder
//                 hintText: 'Password',
//                 prefixIcon: Icon(
//                   Icons.lock,
//                 ), // Icon
//               ), // Input Decoration
//             ),
//             SizedBox(height: 40),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 40,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: buttonColor,
//                   borderRadius: BorderRadius.circular(5),
//                 ), // BoxDecoration
//                 child: Center(
//                   child: InkWell(
//                     onTap: () =>
//                         authController.loginUser(_email.text, _password.text),
//                     child: Text(
//                       'Login',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ), // Texteld)
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 20,
//             ), // SizedBox
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Need an Account?',
//                   style: TextStyle(fontSize: 20),
//                 ), // Text
//                 SizedBox(width: 5),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: ((context) => SignUp())));
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: buttonColor,
//                     ), // TextStyle
//                   ), // Text
//                 ),
//               ],
//             ) // Row
//           ],
//         ), // Column
//       ), // Container
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Video App!!',
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType
      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Simple Login Example"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Login'),
            onPressed: _loginAccount,
          ),
          new FlatButton(
            child: new Text('Dont have an account? Tap here to register.'),
            onPressed: _SignUpPage,
          )
        ],
      ),
    );
  }

  void _loginAccount() {
    print(_email);
    print(_password);
    authController.loginUser(_email, _password);
  }

  void _SignUpPage() {
    print('_SignUpPage');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => SignUp())));
  }
}
