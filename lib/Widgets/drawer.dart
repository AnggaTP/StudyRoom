import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:study_room/states/currentUsers.dart';
import 'package:study_room/states/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.account_circle, text: 'Profile'),
          _createDrawerItem(icon: Icons.people, text: 'Friends'),
          _createDrawerItem(icon: Icons.settings, text: 'Settings'),
          _createDrawerItem(icon: Icons.help, text: 'Help'),
          Divider(),
          Container(
              //margin: EdgeInsets.only(top: 100),
              width: 50,
              height: 50,
              child: FittedBox(
                child: RaisedButton(
                    color: Color(0xff056676),
                    onPressed: () async {
                      CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
                      String _returnString = await _currentUser.signOut();
                      if (_returnString == "success") {
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Root(),),(route) => false);
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.white70),
                        Padding(padding: EdgeInsets.only(right: 5)),
                        Text(
                          'Sign Out',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70)),
                        ),
                      ],
                    )),
              ))
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/image/images.jpg'))),
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.white70,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/image/profile.png')),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Angga Tutur Priantoko',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                    Text(
                      'Student',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white70,
            size: 30,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(text,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ))))
        ],
      ),
      onTap: () {
        print('Button Pressed');
      },
    );
  }

  // Widget _createSignOutButton(
  //     {IconData icon, String text, BuildContext context}) {
  //   return
  // }
}
