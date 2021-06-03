import 'package:flutter/material.dart';
import 'package:study_room/Widgets/bottom_chat.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff5EAAA8),
        appBar: AppBar(
          title: Text('Chat Room'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    width: (screenSize.width * 80) / 100,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 25),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Type Here',
                        hintStyle: TextStyle(fontSize: 20),
                        filled: true,
                        fillColor: Color(0xffC4C4C4),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 13),
                    alignment: Alignment.center,
                    child: IconButton(
                        color: Color(0xffC4C4C4),
                        icon: Icon(Icons.send,size: 40,),
                        onPressed: () {
                          print('button pressed');
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
