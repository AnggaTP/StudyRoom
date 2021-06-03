import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String txt;

  const CustomCheckbox({Key key, this.txt}) : super(key: key);
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: _isSelected ? Colors.blue : Colors.grey,
          ),
          width: (screenSize.width * 25) / 100,
          height: 50),
    );
  }
}
