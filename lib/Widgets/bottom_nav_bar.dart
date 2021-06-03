import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

void setColor(int index) {}

class _BottomNavBarState extends State<BottomNavBar> {
  Color _iconColor = Colors.white70;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: (screenSize.height * 10) / 100,
      color: Colors.blueGrey,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.home, size: 35.0, color: _iconColor),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              }),
          IconButton(
              icon: Icon(Icons.add, size: 35.0, color: _iconColor),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/createroom');
              }),
          IconButton(
              icon: Icon(Icons.mail, size: 35.0, color: _iconColor),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
        ],
      ),
    );
  }
}
