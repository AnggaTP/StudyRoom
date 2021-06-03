import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:study_room/Widgets/bottom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class createRoom extends StatefulWidget {
  @override
  _createRoomState createState() => _createRoomState();
}

class _createRoomState extends State<createRoom> {
  //final firestoreInstance = FirebaseFirestore.instance;
  final _roomname = TextEditingController();

  List<String> lst = ['30 Menit', '45 Menit', '60 Menit'];
  int _isSelected = 0;
  bool tutor = false;
  String _valStudyField;
  List _studyField = [
    "Mathematics",
    "Natural Science",
    "Social Science",
    "Computer",
  ];
  int selectedPos = 0;

  // void _onPressed() {
  //   firestoreInstance.collection("room").add(
  //     {
  //       "roomname" : _roomname,
  //     }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff5EAAA8),
        body: ListView(
          children: <Widget>[
            // Title
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: (screenSize.height * 20) / 100),
              child: Text(
                "Create a Room",
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),

            // Form
            Container(
              margin: EdgeInsets.only(
                left: (screenSize.width * 5) / 100,
                right: (screenSize.width * 5) / 100,
                top: 20,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(8, 10),
                    )
                  ]),
              child: Column(
                children: <Widget>[
                  // Room Name
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Room Name",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                        TextField(
                          controller: _roomname,
                          decoration: InputDecoration(
                              hintText: 'Name Your Room',
                              contentPadding:
                                  EdgeInsets.only(bottom: 5, top: 8),
                              isDense: true),
                        )
                      ],
                    ),
                  ),

                  // Room Time
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Room Time",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomRadio(lst[0], 0),
                              CustomRadio(lst[1], 1),
                              CustomRadio(lst[2], 2),
                            ],
                          )
                        ],
                      )),

                  // Tutor
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Need Tutor",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        flutterSwitch()
                      ],
                    ),
                  ),

                  // Study Field
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Study Field",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                        DropDown(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Button Create Room
            Container(
                margin: EdgeInsets.only(top: 20),
                width: 50,
                height: 50,
                child: FittedBox(
                  child: RaisedButton(
                      color: Color(0xff056676),
                      onPressed: () {
                        print("tombol ditekan");
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.white70),
                          Text(
                            "Create",
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
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget CustomRadio(String txt, int index) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5, right: 5),
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: _isSelected == index ? Color(0xff056676) : Colors.grey,
        ),
        width: (screenSize.width * 25) / 100,
        height: (screenSize.width * 10) / 100,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.alarm,
              color: _isSelected == index ? Colors.white70 : Colors.black,
            ),
            Padding(padding: EdgeInsets.only(right: 5)),
            Text(
              txt,
              style: TextStyle(
                color: _isSelected == index ? Colors.white70 : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  FlutterSwitch flutterSwitch() {
    return FlutterSwitch(
      width: 50.0,
      height: 25.0,
      valueFontSize: 15.0,
      toggleSize: 20.0,
      value: tutor,
      borderRadius: 30.0,
      padding: 3.0,
      showOnOff: true,
      activeText: "Yes",
      inactiveText: "No",
      activeColor: Color(0xff056676),
      onToggle: (val) {
        setState(() {
          tutor = val;
        });
      },
    );
  }

  Widget DropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        hint: Text("Choose Study Field"),
        value: _valStudyField,
        items: _studyField.map((value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _valStudyField = value;
          });
        },
        isExpanded: true,
      ),
    );
  }
}
