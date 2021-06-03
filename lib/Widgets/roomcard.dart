import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomCard extends StatefulWidget {
  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: (screenSize.height * 20) / 100,
      width: (screenSize.width * 90) / 100,
      decoration: BoxDecoration(
          color: Color(0xffC4C4C4),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 4,
            color: Color(0xff056676),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(8, 10),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  'Trigonometri',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Room Time :',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 10, right: 10),
                child: Text(
                  '45:00',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87)),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.perm_identity,
                        size: 20,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 20,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 20,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 20,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 20,
                      ),
                    ],
                  )),
              Container(
                  child: FittedBox(
                // ignore: deprecated_member_use
                child: RaisedButton(
                    color: Color(0xff056676),
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Join",
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
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.content_copy, size: 20),
                    Text(
                      "DK897T",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
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
}
