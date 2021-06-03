import 'package:flutter/material.dart';
import 'package:study_room/Widgets/bottom_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_room/Widgets/drawer.dart';
import 'package:study_room/Widgets/lastroomcard.dart';
import 'package:study_room/Widgets/roomcard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.username}) : super(key: key);
  final String username;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff5EAAA8),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xff5EAAA8),
          ),
          child: AppDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Study Room",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70)),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Button Pressed');
                }),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'On Going Room',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: RoomCard(),
                    ),
                  ],
                ),
              ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Last Room',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 28,fontWeight: FontWeight.w500,color: Colors.white70)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        LastRoomCard(),LastRoomCard(),Divider(),LastRoomCard(),LastRoomCard(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
