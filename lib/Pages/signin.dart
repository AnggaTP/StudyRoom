import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:study_room/states/currentUsers.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  void _signUpUser(String email, String password, String username, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signUpUser(email, password, username);
    try {
      if ( _returnString == "success") {
        Navigator.pushReplacementNamed(context, '/login');
      }else{
        ScaffoldMessengerState().showSnackBar(
          SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff5EAAA8),
      body: ListView(
        children: <Widget>[
          // Logo
          Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            height: (screenSize.height * 15) / 100,
            //width: (screenSize.width * 10)/100,
            child: FittedBox(
              child: Image(
                image: AssetImage(
                  'assets/image/app_logo.png',
                ),
              ),
            ),
          ),

          //Text Sign In
          Container(
            alignment: Alignment.center,
            child: Text(
              'Sign In',
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),

          // Form
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: EdgeInsets.all(15),
            height: (screenSize.height * 43) / 100,
            width: screenSize.width,
            decoration: BoxDecoration(
                color: Color(0xffC4C4C4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.7),
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    // username
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Username',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              hintText: "username",
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                            ),
                            controller: username,
                            validator: (value) {
                              if (value.length < 3) {
                                return "Please enter valid username";
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    // email
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            decoration: new InputDecoration(
                              hintText: "example@gmail.com",
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                            ),
                            controller: email,
                            validator: emailValidator,
                          ),
                        ],
                      ),
                    ),

                    //password
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Password',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              hintText: "password",
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                            ),
                            obscureText: true,
                            controller: password,
                            validator: pwdValidator,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Confirm Password',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              hintText: "confirm password",
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                            ),
                            obscureText: true,
                            controller: confirmpassword,
                            validator: pwdValidator,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Button
          Container(
              margin: EdgeInsets.only(top: 20),
              width: 50,
              height: 50,
              child: FittedBox(
                child: RaisedButton(
                    color: Color(0xff056676),
                    onPressed: () {
                      if (password.text == confirmpassword.text) {
                        _signUpUser(email.text, password.text,username.text, context);
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Sign Up",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70)),
                        ),
                      ],
                    )),
              )),

          Container(
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Already have an account ?',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
                TextSpan(
                    text: ' Log In',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, '/login');
                      })
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
