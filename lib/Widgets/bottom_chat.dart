import 'package:flutter/material.dart';

class BottomChat extends StatefulWidget {
  @override
  _BottomChatState createState() => _BottomChatState();
}

class _BottomChatState extends State<BottomChat> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: (screenSize.height * 10) / 100,
      child: Row(
        children: <Widget>[
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Type Here'
              ),
            ),
          )
        ],
      ),
    );
  }
}
