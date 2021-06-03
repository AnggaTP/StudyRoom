import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastRoomCard extends StatefulWidget {
  @override
  _LastRoomCardState createState() => _LastRoomCardState();
}

class _LastRoomCardState extends State<LastRoomCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: (screenSize.height * 10) / 100,
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
              offset: Offset(5, 5),
            )
          ]),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
                  child: Text(
                    "Nama Room",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.perm_identity,
                        size: 15,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 15,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 15,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 15,
                      ),
                      Icon(
                        Icons.perm_identity,
                        size: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: 20),
                  height: 40,
                  child: FittedBox(
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        color: Color(0xff056676),
                        onPressed: () {
                          print("tombol ditekan");
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Open",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70)),
                            ),
                          ],
                        )),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
