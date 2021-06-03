import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:study_room/states/currentUsers.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await _currentUser.loginUser(email, password) == "success") {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print("gagal login");
      }
    } catch (e) {
      print(e);
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
            margin: EdgeInsets.only(top: 100),
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
              'Log In',
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),

          // Form
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            padding: EdgeInsets.all(15),
            height: (screenSize.height * 23) / 100,
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
                    // email
                    Container(
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
                            controller: password,
                            obscureText: true,
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
                    onPressed: () {_loginUser(email.text, password.text, context);},
                    child: Row(
                      children: <Widget>[
                        Text("Log In",style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white70)),),
                      ],
                    )),
              )),

          Container(
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have any account ?',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ),
                TextSpan(
                    text: ' Sign In',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, '/signin');
                      })
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
